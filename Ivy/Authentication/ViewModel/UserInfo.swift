//
//  CloudKitUserBootcamp.swift
//  CKdb
//
//  Created by Alaa Alabdullah on 18/12/2022.
//

import SwiftUI
import CloudKit


class CloudKitUserBootcampViewModel: ObservableObject {
    
    @Published var primissinStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    
    init(){
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    
    private func getiCloudStatus() {
        CKContainer(identifier: "iCloud.com.example.CKdb2").accountStatus { [weak self] returnendStatus, returnedError in
            DispatchQueue.main.async {
                switch returnendStatus {
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountNotDetermind.rawValue
                case .available:
                    self?.isSignedInToiCloud = true
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                default:
                    self?.error = CloudKitError.iCloudAccountUnknown.localizedDescription
                }
            }
        }
    }
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermind
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    
    func requestPermission(){
        CKContainer(identifier: "iCloud.com.example.CKdb2").requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.primissinStatus = true
                }
            }
        }
    }
    
    func fetchiCloudUserRecordID(){
        CKContainer(identifier: "iCloud.com.example.CKdb2").fetchUserRecordID { [weak self] ReturnedID, returnedError in
            if let id = ReturnedID {
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
    
    func discoveriCloudUser(id: CKRecord.ID) {
        CKContainer(identifier: "iCloud.com.example.CKdb2").discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName {
                    self?.userName = name
                }
            }
        }
    }
}


struct CloudKitUserBootcamp: View {
    
    @StateObject private var vm = CloudKitUserBootcampViewModel()
    
    var body: some View {
        VStack{
            Text("IS SIGNED IN: \(vm.isSignedInToiCloud.description.uppercased())")
            Text(vm.error)
            Text("PERMISSION: \(vm.primissinStatus.description.uppercased())")
            Text("NAME: \(vm.userName)")
        }
    }
}

struct CloudKitUserBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUserBootcamp()
    }
}

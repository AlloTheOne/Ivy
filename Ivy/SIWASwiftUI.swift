//
//  SIWASwiftUI.swift
//  CKdb
//
//  Created by Alaa Alabdullah on 21/12/2022.
//
import AuthenticationServices
import SwiftUI
import CloudKit


//class signUpViewModel: ObservableObject {
//    @AppStorage("email") var email: String = ""
//    @AppStorage("firstName") var firstName: String = ""
//    @AppStorage("lastName") var lastName: String = ""
//    @AppStorage("userId") var userId: String = ""
//
//
//}


struct SIWASwiftUI: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    private var isSignedIn: Bool {
        !userId.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                if !isSignedIn {
                    signInButtonView()
                }
                else {
//                    if let name = fetchUserName() {
//                          Text("Welcome, \(name)!")
//                        } else {
//                          Text("Please sign in to continue.")
//                        }
                }
            }
            .navigationBarTitle("Sign in with apple")
        }
//        func fetchUserName() -> String? {
//          let container = CKContainer.default()
//          let privateDatabase = container.privateCloudDatabase
//          let appleIDProvider = ASAuthorizationAppleIDProvider()
//            if let currentUserId = appleIDProvider.currentUserIdentifier {
//            let predicate = NSPredicate(format: "userId == %@", currentUserId)
//            let query = CKQuery(recordType: "User", predicate: predicate)
//            privateDatabase.perform(query, inZoneWith: nil) { (records, error) in
//              if let error = error {
//                // handle error
//                return
//              }
//              if let records = records, records.count > 0 {
//                let record = records[0]
//                if let name = record["firstName"] as? String {
//                return name
//                }
//              }
//            }
//          }
//          return nil
//        }
    }
    

}

struct signInButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    var body: some View{
        SignInWithAppleButton(.continue) { request in
            request.requestedScopes = [.email, .fullName]
        } onCompletion: { result in
            
            switch result {
            case .success(let auth):
                
                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    
                    let userId = credential.user
                    
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    // Access the CloudKit database
                    let container = CKContainer(identifier: "iCloud.com.example.CKdb2")
                    let privateDatabase = container.publicCloudDatabase
                    let predicate = NSPredicate(format: "userId == %@", userId)
                          let query = CKQuery(recordType: "User", predicate: predicate)
                          privateDatabase.perform(query, inZoneWith: nil) { (records, error) in
                            if let error = error {
                              // handle error
                              return
                            }
                            if let records = records, records.count > 0 {
                              // user already signed up, do nothing
                            } else {
                                
                                // Save data to the CloudKit database
                                let record = CKRecord(recordType: "User")
                                record["userId"] = userId
                                record["firstName"] = firstName
                                record["lastName"] = lastName
                                record["email"] = email
                                
                                let database = privateDatabase
                                database.save(record) { (record, error) in
                                    if let error = error {
                                        print("Error saving record: \(error.localizedDescription)")
                                    } else {
                                        print("Record saved successfully")
                                        //print("\(email)")
                                    }
                                }
                            }
                    }
                default:
                    break
                }
                
            case .failure(let error):
                print(error)
            }
        }
        .signInWithAppleButtonStyle(
            colorScheme == .dark ? .white : .black
        )
        .frame(height: 50)
        .padding()
        .cornerRadius(8)
    }
    }

//struct signedIn: View {
//    var body: some View {
//
//
//    }
//}

struct SIWASwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SIWASwiftUI()
    }
}

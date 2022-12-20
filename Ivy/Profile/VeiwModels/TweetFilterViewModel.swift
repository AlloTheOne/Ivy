//
//  TweetFilterViewModel.swift
//  Ivy
//
//  Created by Sara Khalid BIN kuddah on 24/05/1444 AH.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable{
    case tweets
    case replies
    case likes
    
    var title: String{
        switch self {
        case .tweets: return "Points"
        case .replies: return "Badges"
        case .likes: return "My activities"
        }
    }
}

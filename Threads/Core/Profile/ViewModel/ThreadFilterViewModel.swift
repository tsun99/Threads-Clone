//
//  ThreadFilterViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/14/23.
//

import Foundation

enum ThreadFilterViewModel: Int, CaseIterable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
}

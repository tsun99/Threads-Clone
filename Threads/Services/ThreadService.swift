//
//  ThreadService.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/17/23.
//

import Foundation
import Firebase

struct ThreadService {
    
    private static let threadsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedThreads() async throws -> [Thread] {
        let snapshot = try await threadsCollection.getDocuments()
        
        var threads = try snapshot.documents.compactMap({ try $0.data(as: Thread.self) })
        
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
        return threads
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await threadsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        return try snapshot.documents.compactMap({ try $0.data(as: Thread.self) })
    }
}

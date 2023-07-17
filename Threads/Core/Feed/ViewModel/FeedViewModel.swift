//
//  FeedViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/17/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var threads = [Thread]()
    
    init(){
        Task { try await fetchThreads() }
    }
    
    @MainActor
    func fetchThreads() async throws{
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        
        self.threads = try snapshot.documents.compactMap({ try $0.data(as: Thread.self) })
        
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
        
    }
    
}

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
        self.threads = try await ThreadService.fetchFeedThreads()
        
    }
    
}

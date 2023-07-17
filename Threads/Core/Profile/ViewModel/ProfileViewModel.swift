//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/17/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    private let user: User
    @Published var threads = [Thread]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserThreads() }
    }
    @MainActor
    func fetchUserThreads() async throws {
        self.threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
    }
}

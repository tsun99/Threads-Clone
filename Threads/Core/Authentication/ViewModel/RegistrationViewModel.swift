//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/16/23.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username, fullname: fullname)
        
        username = ""
        email = ""
        password = ""
        fullname = ""
    }
}

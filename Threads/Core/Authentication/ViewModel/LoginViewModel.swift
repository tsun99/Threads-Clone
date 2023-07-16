//
//  LoginViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/16/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}

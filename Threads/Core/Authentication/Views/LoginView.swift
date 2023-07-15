//
//  LoginView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI

struct LoginView: View {
    @State private var emailField = ""
    @State private var passwordField = ""
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image("Pattern")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 500)
                        
                }
                
                VStack {
                    TextField("Email", text: $emailField)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(14)
                        .background(Color(.systemGray5))
                        .cornerRadius(14)
                        .padding(.top, 48)
                        .padding(.horizontal, 30)
                    
                    SecureField("Password", text: $passwordField)
                        .font(.subheadline)
                        .padding(14)
                        .background(Color(.systemGray5))
                        .cornerRadius(14)
                        .padding(.horizontal, 30)
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Forgot Password?")
                    } label: {
                        Text("Forgot Password?")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.top)
                            .padding(.horizontal)
                            
                        
                    }
                }
                
                Button {
                    // Sign in
                } label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 330, height: 50)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.purple, .pink, .red, .yellow]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                }
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Dont have an account? ") + Text("Sign up")
                        .fontWeight(.bold)
                }
                .padding(.top, 8)
                .foregroundColor(.secondary)
                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

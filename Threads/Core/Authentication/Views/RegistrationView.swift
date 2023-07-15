//
//  RegistrationView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var emailField = ""
    @State private var usernameField = ""
    @State private var fullNameField = ""
    @State private var passwordField = ""
    
    @Environment(\.dismiss) var dismiss
    
    private var isDisabled: Bool {
        return emailField.isEmpty || passwordField.isEmpty || usernameField.isEmpty || fullNameField.isEmpty
    }
    
    var body: some View {
        VStack {
            Image("ThreadsLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.primary)
            
            Text("Create a new account")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.vertical, 40)
            
            VStack {
                
                TextField("Email", text: $emailField)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                
                Divider()
                
                
                TextField("Username", text: $usernameField)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                
                Divider()
                
                TextField("Full Name", text: $fullNameField)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                
                Divider()
                
                SecureField("Password", text: $passwordField)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                
                Divider()
            }
            
            Spacer()
            
            
            NavigationLink {
                CompleteRegistrationView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Sign up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 330, height: 50)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.purple, .pink, .red, .yellow]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .opacity(isDisabled ? 0.5 : 1)
            }
            .disabled(isDisabled)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrowshape.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegistrationView()
            
        }
    }
}

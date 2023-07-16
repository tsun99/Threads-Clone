//
//  RegistrationView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    private var isDisabled: Bool {
        return viewModel.email.isEmpty || viewModel.password.isEmpty || viewModel.username.isEmpty || viewModel.fullname.isEmpty
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
                
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                    .autocorrectionDisabled()
                
                Divider()
                
                
                TextField("Username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                    .autocorrectionDisabled()
                
                Divider()
                
                TextField("Full Name", text: $viewModel.fullname)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                    .autocorrectionDisabled()
                
                Divider()
                
                SecureField("Password", text: $viewModel.password)
                    .font(.subheadline)
                    .padding(14)
                    .background(Color(.systemGray5))
                    .cornerRadius(14)
                    .padding(.horizontal, 24)
                    .autocorrectionDisabled()
                
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

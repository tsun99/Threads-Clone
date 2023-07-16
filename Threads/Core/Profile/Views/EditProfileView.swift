//
//  EditProfileView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/16/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var selectedImage: PhotosPickerItem?
    
    @StateObject var viewModel: EditProfileViewModel
    
    @Environment(\.dismiss) var dismiss
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("Edit profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button("Done") {
                        Task { try await viewModel.updateUserDate() }
                        dismiss()
                    }
                }
                .padding()
            }
            Divider()
            
            Spacer()
            
            VStack {
                PhotosPicker(selection: $viewModel.selectedImage) {
                    
                    if let image = viewModel.userImage {
                        
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .background(.gray)
                            .foregroundColor(.primary)
                            .clipShape(Circle())
                        
                        
                        
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .background(.gray)
                            .foregroundColor(.primary)
                            .clipShape(Circle())
                    }
                }
                
            }
            Divider()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text("Name:")
                        .padding(.horizontal, 25)
                        .font(.subheadline)
                    
                    TextField("Name", text: $viewModel.fullname)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(14)
                        .background(Color(.systemGray5))
                        .cornerRadius(14)
                        .padding(.horizontal, 24)
                        .autocorrectionDisabled()
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Bio:")
                        .padding(.horizontal, 25)
                        .font(.subheadline)
                    
                    TextField("Bio", text: $viewModel.bio)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(14)
                        .background(Color(.systemGray5))
                        .cornerRadius(14)
                        .padding(.horizontal, 24)
                        .autocorrectionDisabled()
                    
                }
                
            }
            
            Spacer()
            
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}

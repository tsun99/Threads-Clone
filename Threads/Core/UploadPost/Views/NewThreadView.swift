//
//  NewThreadView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI
import PhotosUI

struct NewThreadView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var threadText = ""
    
    @State private var imagePickerPresented = false
    @StateObject var viewModel = NewThreadViewModel()
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    threadText = ""
                    viewModel.userImage = nil
                    viewModel.selectedImage = nil
                    dismiss()
                }
                Spacer()
                
                Text("New Thread")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 32)
                
                Spacer()
                
                Button("Post") {
                    Task {
                        try await viewModel.uploadThread(text: threadText)
                        clearThreadDataAndReturn()
                    }
                }
            }
            .padding()
            
            HStack {
                VStack {
                            
                    CircularProfileImageView(user: user, size: .thread)
                        
                    
                    Rectangle()
                        .frame(width: 2)
                        .frame(maxHeight: .infinity)
                        .foregroundColor(.secondary)
                    
                
                    CircularProfileImageView(user: user, size: .reply3)
                            .opacity(0.5)
                }
                .padding(8)
                
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.headline)
                        .padding(.top, 24)
                    
                    
                    TextField("Start a thread...", text: $threadText, axis: .vertical)
                        .lineLimit(25)
                        .autocorrectionDisabled()
                    
                    Button {
                        imagePickerPresented.toggle()
                    } label: {
                        Image(systemName: "paperclip")
                    }
                    .foregroundColor(.primary)
                    .imageScale(.large)
                    
                    VStack(spacing: 12) {
                        
                        if let image = viewModel.userImage {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                    }
                    }
                    Spacer()
                }
            }
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearThreadDataAndReturn() {
        threadText = ""
        viewModel.userImage = nil
        viewModel.selectedImage = nil
        dismiss()
    }
}

struct NewThreadView_Previews: PreviewProvider {
    static var previews: some View {
        NewThreadView(user: User.MOCK_USERS[0])
    }
}

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
                    
                }
            }
            .padding()
            
            HStack {
                VStack {
                            
                    Image("Harry")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .clipShape(Circle())
                        
                    
                    Rectangle()
                        .frame(width: 2)
                        .frame(maxHeight: .infinity)
                        .foregroundColor(.secondary)
                    
                
                        Image("Harry")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .clipShape(Circle())
                            .opacity(0.5)
                }
                .padding(8)
                
                VStack(alignment: .leading) {
                    Text("User Name")
                        .font(.headline)
                        .padding(.top, 24)
                    
                    
                    TextField("Start a thread...", text: $threadText, axis: .vertical)
                        .lineLimit(25)
                    
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
}

struct NewThreadView_Previews: PreviewProvider {
    static var previews: some View {
        NewThreadView()
    }
}

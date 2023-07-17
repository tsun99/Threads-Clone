//
//  NewThreadViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/16/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class NewThreadViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)}}
    }
    
    @Published var userImage: Image?
    
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.userImage = Image(uiImage: uiImage)
    }
    
    func uploadThread(text: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // change into if let uiImage = uiImage {}
//        guard let uiImage = uiImage else { return }
        let thread: Thread
        
        let postRef = Firestore.firestore().collection("posts").document()
        if let uiImage = self.uiImage {
            guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
            thread = Thread(id: postRef.documentID, ownerUid: uid, text: text, likes: 0, replies: 0, imageUrl: imageUrl, timestamp: Timestamp())
            
        } else {
            thread = Thread(id: postRef.documentID, ownerUid: uid, text: text, likes: 0, replies: 0, imageUrl: nil, timestamp: Timestamp())
        }
        guard let encodedThread = try? Firestore.Encoder().encode(thread) else { return }
        
        try await postRef.setData(encodedThread)
        
            
        
    }
}

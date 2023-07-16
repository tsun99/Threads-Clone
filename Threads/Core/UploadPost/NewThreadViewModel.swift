//
//  NewThreadViewModel.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/16/23.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class NewThreadViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)}}
    }
    
    @Published var userImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.userImage = Image(uiImage: uiImage)
    }
}

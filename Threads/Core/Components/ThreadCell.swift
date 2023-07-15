//
//  ThreadCell.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/14/23.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    
    var body: some View {
        HStack {
            
            VStack {
                if let user = thread.user {
                    if let profileImage = user.profileImageUrl {
                        
                        Image(profileImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60)
                            .clipShape(Circle())
                        
                    }
                }
                
                Rectangle()
                    .frame(width: 2)
                    .frame(maxHeight: .infinity)
                    .foregroundColor(.secondary)
                
                ZStack{
//                    TODO:: CHANGE THESE TO PICTURES OF USERS THAT REPLIED
                    Image("Harry")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .clipShape(Circle())
                        .offset(x: 0, y: 30)
                    Image("Draco")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .clipShape(Circle())
                        .offset(x: -15, y: 10)
                    Image("Ron")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .clipShape(Circle())
                        .offset(x: 15, y: 5)
                }
            }
            .padding(8)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    if let user = thread.user {
                        
                        Text(user.username)
                            .font(.headline)
                    }
                    
                    Spacer()
                    
                    Text("2h")
                        .foregroundColor(.secondary)
                    
                    Button() {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                    .foregroundColor(.primary)
                }
                
                
                Text(thread.text ?? "")
                  
                if let threadImage = thread.imageUrl {
                    
                    Image(threadImage)
                        .resizable()
                        .scaledToFit()
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "bubble.right")
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                    }
                    
                }
                .foregroundColor(.primary)
                
                
                HStack {
                    Text("\(thread.replies) replies")
                    Text("\(thread.likes) likes")
                }
                .foregroundColor(.secondary)

            }
            .padding(.trailing)
            .padding(.top)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(thread: Thread.MOCK_THREADS[0])
    }
}

//
//  ThreadCell.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/14/23.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
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
                
                ZStack{
                    
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
            .padding(.leading)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("User Name")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("2h")
                        .foregroundColor(.secondary)
                    
                    Button() {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                    .foregroundColor(.primary)
                }
                
                
                Text("This is the thread text. it might be long it might not be long. So if I'm writing more text ")
                  
                
                Image("Harry")
                    .resizable()
                    .scaledToFit()
                
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
                
                Spacer()
                
                HStack {
                    Text("10 replies")
                    Text("42 likes")
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
        ThreadCell()
    }
}

//
//
//  SearchView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    
                    ForEach(User.MOCK_USERS) { user in
                        VStack {
                            NavigationLink(value: user) {
                                
                                HStack() {
                                    if let image = user.profileImageUrl {
                                        
                                        Image(image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                        
                                    } else {
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                    }
                                    VStack(alignment: .leading) {
                                        
                                        Text(user.username)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                        
                                        Text(user.fullname)
                                            .foregroundColor(.secondary)
                                        
                                    }
                                    
                                    
                                    Spacer()
                                    
                                    Button {
                                        // implement follow user functionality
                                    } label: {
                                        Text("Follow")
                                            .foregroundColor(.primary)
                                            .font(.caption)
                                            .bold()
                                            .frame(width: 75, height: 30)
                                            .overlay (
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Color.secondary, lineWidth: 1)
                                            )
                                        
                                    }
                                    .padding(.horizontal, 4)
                                    
                                }
                            }
                            .padding(.horizontal)
                            
                            Divider()
                            
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.top, 6)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

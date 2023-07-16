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
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    
                    ForEach(viewModel.users) { user in
                        VStack {
                            NavigationLink(value: user) {
                                
                                HStack() {
                                    
                                    CircularProfileImageView(user: user, size: .search)
                                    
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

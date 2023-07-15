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
                    
                    ForEach(0...15, id: \.self) { user in
                        VStack {
                            HStack() {
                                Image("Harry")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("HarryP")
                                        .fontWeight(.semibold)
                                    
                                    Text("Harry Potter")
                                        .foregroundColor(.secondary)
                                    
                                }
                                
                                
                                Spacer()
                                
                                Button {
                                    
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
                            .padding(.horizontal)
                            
                            Divider()
                            
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.top, 6)
                .searchable(text: $searchText, prompt: "Search")
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

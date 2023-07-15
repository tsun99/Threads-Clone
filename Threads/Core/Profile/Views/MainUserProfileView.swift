//
//  MainUserProfileView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI

struct MainUserProfileView: View {
    
    @State private var selectedFilter: ThreadFilterViewModel = .threads
    
    @Namespace var animation
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                VStack(alignment: .leading) {
                    
                //Profile info
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Full Name")
                                .foregroundColor(.primary)
                                .font(.title)
                                .bold()
                            
                            Text("User Name")
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        Image("Harry")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }
                    
                    Text("Bio")
                    
                    Text("0 Followers")
                        .foregroundColor(.secondary)
                        .padding(.vertical, 5)
                    
                    Button("Edit Profile") {
                        //Edit Profile
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(height: 32)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.secondary, lineWidth: 1))
                    
                    HStack {
                        ForEach(ThreadFilterViewModel.allCases, id: \.rawValue) { item in
                            
                            VStack {
                                Text(item.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == item ? .semibold : .regular)
                                    .foregroundColor(selectedFilter == item ? .primary : .secondary)
                                
                                
                                    Capsule()
                                    .foregroundColor(selectedFilter == item ? .primary : .secondary)
                                    .frame(height: 3)

                            }
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedFilter = item
                                }
                            }
                        }
                    }
                    .overlay(Divider().offset(x: 0, y: 17))
                    
                }
                .padding()
                
                LazyVStack {
                    //Threads
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "lock")
                    }
                    .foregroundColor(.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label : {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}

struct MainUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MainUserProfileView()
    }
}

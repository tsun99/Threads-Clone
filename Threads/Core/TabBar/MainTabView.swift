//
//  MainTabView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/10/23.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var showingNewPostView = false
    @State private var selectedItem = 1
    @State private var oldSelectedItem = 1
    
    var body: some View {
        TabView (selection: $selectedItem){
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(2)
            
            Text("")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
                .tag(3)
            
            RegistrationView()
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(4)
            
            MainUserProfileView(user: User.MOCK_USERS[0])
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(5)
        }
        .accentColor(.primary)
        .onChange(of: selectedItem) {
            if selectedItem == 3 {
                self.showingNewPostView.toggle()
                self.selectedItem = oldSelectedItem
            } else if (showingNewPostView == false) {
                self.oldSelectedItem = $0
            }
        }
        .sheet(isPresented: $showingNewPostView) {
            NewThreadView()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

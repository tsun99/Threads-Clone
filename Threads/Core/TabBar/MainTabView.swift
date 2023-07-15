//
//  MainTabView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/10/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Post")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
            RegistrationView()
                .tabItem {
                    Image(systemName: "heart")
                }
            MainUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.primary)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

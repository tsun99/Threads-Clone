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
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Post")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            Text("Profile")
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

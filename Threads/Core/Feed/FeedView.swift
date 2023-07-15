//
//  FeedView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/14/23.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("ThreadsLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(.primary)
                    .padding(.bottom)
                
                LazyVStack() {
                    
                    ForEach(Thread.MOCK_THREADS) { thread in
                        ThreadCell(thread: thread)
                            .padding(.bottom, 24)
                        
                        Divider()
                    }
                }
            }
            .padding(.top, 1)
          
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

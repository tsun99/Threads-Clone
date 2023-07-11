//
//  ProfileView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/10/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Header
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        // privacy settings
                    } label: {
                        Image(systemName: "globe")
                            .foregroundColor(.primary)
                            .imageScale(.large)
                    }
                    
                    Spacer()
                    
                    Button {
                        // settings
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(.primary)
                            .imageScale(.large)
                    }
                }
                .padding(.vertical)
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
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }
                .padding(.bottom, 10)
                
                
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
                
            }
            .padding()
            
            //Threads
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

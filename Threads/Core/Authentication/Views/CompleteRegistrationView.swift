//
//  CompleteRegistrationView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import SwiftUI

struct CompleteRegistrationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image("ThreadsLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text("Welcome to Threads, username.username")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start using Threads")
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                print("Complete sign up")
            } label: {
                Text("Complete Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 330, height: 50)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.purple, .pink, .red, .yellow]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
            }
            
            Spacer()
            
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrowshape.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CompleteRegistrationView()
        }
    }
}

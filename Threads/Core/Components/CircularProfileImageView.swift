//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/16/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case profile
    case thread
    case reply1
    case reply2
    case reply3
    case search
    
    var dimension: CGFloat {
        switch self {
        case .profile:
            return 80
        case .thread:
            return 60
        case .reply1:
            return 20
        case .reply2:
            return 25
        case .reply3:
            return 30
        case .search:
            return 50
        }
    }
}

struct CircularProfileImageView: View {
    
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray5))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], size: .thread)
    }
}

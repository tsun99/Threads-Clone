//
//  User.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    
    let id: String
    let email: String
    var username: String
    var fullname: String
    var followers: Int = 0
    
    var profileImageUrl: String?
    var bio: String?
    
    
}
extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "harry@gmail.com", username: "harryP", fullname: "Harry Potter", followers: 54, profileImageUrl: "Harry", bio: "I'm the chosen one."),
        .init(id: NSUUID().uuidString, email: "ron@gmail.com", username: "ronW", fullname: "Ron Weasley", followers: 12, profileImageUrl: "Ron", bio: "I'm a ginger looking man"),
        .init(id: NSUUID().uuidString, email: "hermione@gmail.com", username: "hermioneG", fullname: "Hermione Granger", followers: 15, profileImageUrl: "Hermione", bio: "I'm the smart one."),
        .init(id: NSUUID().uuidString, email: "draco@gmail.com", username: "dracoM", fullname: "Draco Malfoy", followers: 3, profileImageUrl: nil, bio: "I tried to kill Snape and failed"),
        .init(id: NSUUID().uuidString, email: "neville@gmail.com", username: "nevilleL", fullname: "Neville Longbottom", followers: 50, profileImageUrl: "Neville", bio: "")
    ]
}

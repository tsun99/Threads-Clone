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
    
    var profileImageUrl: String?
    var bio: String?
    
    
}
extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "harryp@gmail.com", username: "harryP", fullname: "Harry Potter", profileImageUrl: "Harry", bio: "I'm the chosen one."),
        .init(id: NSUUID().uuidString, email: "ronw@gmail.com", username: "ronW", fullname: "Ron Weasley", profileImageUrl: "Ron", bio: "I'm a ginger looking man"),
        .init(id: NSUUID().uuidString, email: "hermioneg@gmail.com", username: "hermioneG", fullname: "Hermione Granger", profileImageUrl: "Hermione", bio: "I'm the smart one."),
        .init(id: NSUUID().uuidString, email: "dracom@gmail.com", username: "dracoM", fullname: "Draco Malfoy", profileImageUrl: "Draco", bio: "I tried to kill Snape and failed"),
        .init(id: NSUUID().uuidString, email: "nevillel@gmail.com", username: "nevilleL", fullname: "Neville Longbottom", profileImageUrl: "Neville", bio: "I killed a snake once, and then became a headmaster at Hogwarts")
    ]
}

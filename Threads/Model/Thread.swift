//
//  Thread.swift
//  Threads
//
//  Created by Tomas Sungaila on 7/15/23.
//

import Foundation
import Firebase

struct Thread: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let text: String?
    let likes: Int
    let replies: Int
    let imageUrl: String?
    let timestamp: Timestamp
    var user: User?
}

extension Thread {
    static var MOCK_THREADS: [Thread] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "First Thread, woohooo!", likes: 3, replies: 0, imageUrl: nil, timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "What the flip is a Thread???", likes: 42, replies: 0, imageUrl: nil, timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "This is me", likes: 3, replies: 0, imageUrl: "Hermione", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: nil, likes: 153, replies: 0, imageUrl: "Draco", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "I love Herbology", likes: 0, replies: 0, imageUrl: "Neville", timestamp: Timestamp(), user: User.MOCK_USERS[4]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "Like I said, I'm the chosen one", likes: 14524, replies: 0, imageUrl: "Harry", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "Bloody Hell", likes: 49, replies: 0, imageUrl: "Ron", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, text: "Can't wait for the exams! I've been studying so much..", likes: 9, replies: 0, imageUrl: nil, timestamp: Timestamp(), user: User.MOCK_USERS[2]),
    ]
    
}

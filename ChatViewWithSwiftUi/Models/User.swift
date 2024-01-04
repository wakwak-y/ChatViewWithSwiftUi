//
//  User.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/04.
//

import Foundation

struct User: Decodable {
    static var currentUser: User {
        User(id: "1", name: " カーキ", image: "user01")
    }
    
    let id: String
    let name: String
    let image: String
    
    var isCurrentUser: Bool { self.id == User.currentUser.id }
}

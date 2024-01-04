//
//  Chat.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/04.
//

import Foundation

struct Chat: Decodable {
    let id: String
    let messages: [Message]
}

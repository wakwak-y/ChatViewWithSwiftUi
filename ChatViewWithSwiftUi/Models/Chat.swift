//
//  Chat.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/04.
//

import Foundation

struct Chat: Decodable, Identifiable {
    let id: String
    let messages: [Message]
    
    var recentMessageText: String { self.messages.last?.text ?? "" }
    var recentMessageDateString: String {
        guard let message = self.messages.last else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = formatter.date(from: message.date) else { return "" }
        
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: date)
    }
}

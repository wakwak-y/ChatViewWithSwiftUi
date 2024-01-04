//
//  ChatViewModel.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/04.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    var chatData: [Chat] = []
    
    init() {
        chatData = fetchChatData()
        messages = chatData[0].messages
    }
    
    private func fetchChatData() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("\(fileName) not found.")
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("Failed to load \(fileName).")
        }
        
        do {
            return try JSONDecoder().decode([Chat].self, from: data)
        } catch {
            fatalError("Failed to decode \(fileName).")
        }
    }
    
    func addMessage(text: String) {
        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: Date().description,
            readed: false
        )
        
        messages.append(newMessage)
    }
}

//
//  ChatViewModel.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/04.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var chatData: [Chat] = []
    
    init() {
        chatData = fetchChatData()
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
    
    func addMessage(chatId: String, text: String) {
        guard let index = chatData.firstIndex(where: { chat in
            chat.id == chatId
        }) else { return }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDateString = formatter.string(from: Date())
        
        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: formattedDateString,
            readed: false
        )
        
        chatData[index].messages.append(newMessage)
    }
}

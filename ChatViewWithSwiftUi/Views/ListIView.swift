//
//  ListIView.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/04.
//

import SwiftUI

struct ListIView: View {
    @ObservedObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                header
                list
            }
            .padding(.horizontal)
        }
    }
}

extension ListIView {
    private var header: some View {
        HStack {
            Text("Talk")
                .font(.title2.bold())
            
            Spacer()
            
            HStack(spacing: 16) {
                Image(systemName: "text.badge.checkmark")
                Image(systemName: "square")
                Image(systemName: "ellipsis.bubble")
            }
            .font(.title2)
        }
    }
    
    private var list: some View {
        ScrollView {
            VStack {
                ForEach(chatViewModel.chatData) { chat in
                    NavigationLink {
                        ChatView(chat: chat)
                            .toolbar(.hidden)
                    } label: {
                        listRow(chat: chat)
                    }
                }
            }
        }
    }
    
    private func listRow(chat: Chat) -> some View {
        HStack {
            Image("user01")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("トーク")
                    .foregroundColor(.primary)
                Text(chat.recentMessageText)
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            
            Spacer()
            
            Text("12/31")
                .font(.footnote)
                .foregroundColor(Color(uiColor: .secondaryLabel))
        }
    }
}

#Preview {
    ListIView()
}

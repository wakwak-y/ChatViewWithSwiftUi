//
//  ChatView.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/03.
//

import SwiftUI

struct ChatView: View {
    @State private var textFieldText: String = ""
    @FocusState private var textFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            messageArea.overlay(navigationArea ,alignment: .top)
            inputArea
        }
    }
}

extension ChatView {
    private var messageArea: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(chatViewModel.messages) { message in
                        MessageRow(message: message)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 72)
            }
            .background(Color.background)
            .onTapGesture { textFieldFocused = false }
            .onAppear { scrollToLast(proxy: proxy) }
        }
    }
    
    private var inputArea: some View {
        HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            
            TextField("Aa", text: $textFieldText)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    , alignment: .trailing
                )
                .onSubmit {
                    sendMessage()
                }
                .focused($textFieldFocused)
            
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(uiColor: .systemBackground))
    }
    
    private var navigationArea: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            
            Text("Title")
                .font(.title2.bold())
            Spacer()
            
            HStack(spacing: 16) {
                Image(systemName: "text.magnifyingglass")
                Image(systemName: "phone")
                Image(systemName: "line.3.horizontal")
            }
            .font(.title2)
        }
        .padding()
        .background(Color.background.opacity(0.9))
    }
    
    private func sendMessage() {
        if !textFieldText.isEmpty {
            chatViewModel.addMessage(text: textFieldText)
            textFieldText = ""
        }
    }
    
    private func scrollToLast(proxy: ScrollViewProxy) {
        if let lastMessage = chatViewModel.messages.last {
            proxy.scrollTo(lastMessage.id, anchor: .bottom)
        }
    }
}

#Preview {
    ChatView()
}

//
//  ChatView.swift
//  ChatViewWithSwiftUi
//
//  Created by Yu Wakui on 2024/01/03.
//

import SwiftUI

struct ChatView: View {
    @State private var textFieldtext: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            messageArea.overlay(navigationArea ,alignment: .top)
            inputArea
        }
    }
}

extension ChatView {
    private var messageArea: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(0..<15) { _ in
                    MessageRow()
                }
            }
            .padding(.horizontal)
            .padding(.top, 72)
        }
        .background(.cyan)
    }
    
    private var inputArea: some View {
        HStack {
            HStack {
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            
            TextField("Aa", text: $textFieldtext)
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
            
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding()
        .background(.white)
    }
    
    private var navigationArea: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .font(.title2)
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
        .background(.cyan.opacity(0.9))
    }
}

#Preview {
    ChatView()
}

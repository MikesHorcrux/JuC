//
//  ChatView.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import SwiftUI
import OpenAIKit

struct ChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.messages, id: \.self) { message in
                        if message.role == "user" {
                            HStack {
                                Spacer()
                                Text(message.content)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(.leading, 40)
                                    .padding(.trailing)
                            }
                        } else {
                            HStack {
                                Text(message.content)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .padding(.trailing, 40)
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                    }
                }
                .padding(.vertical)
            }
            HStack {
                TextField("Type a message...", text: $messageText)
                    .padding(8)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Button(action: {
                    Task{
                        viewModel.messages.append(Chat.Message(role: "user", content: messageText))
                        await viewModel.sendMessage()
                        messageText = ""
                    }
                }, label: {
                    Text("Send")
                })
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

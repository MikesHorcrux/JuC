//
//  ChatView.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import SwiftUI
import OpenAIKit

struct ChatView: View {
    @ObservedObject var JuCManager: ChatViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(JuCManager.messages, id: \.self) { message in
                        if message.role == "user" {
                            UserChatBubble(msg: message.content)
                        } else {
                            JuCChatBubble(msg: message.content)
                        }
                        
                    }
                }
                .padding(.top)
                .padding(.bottom, 155)
            }
//            ZStack(alignment: .bottom){
//                HStack {
////                    VStack {
////                        TextEditor(text: $messageText)
////                            .padding(.horizontal)
////                            .frame(idealHeight: 5, maxHeight: 150)
////                            .scrollContentBackground(.hidden)
////                                                                    .background(.indigo)
////                            .cornerRadius(15)
////                            .lineLimit(1...3)
////                            .multilineTextAlignment(.leading)
////
////
////                    }
//                    VStack {
//                                Spacer()
//                                TextEditor(text: $messageText)
//                                    .frame(height: 30, alignment: .top)
//                                    .fixedSize(horizontal: false, vertical: true)
//                                    .lineLimit(1)
//                                    .padding(.horizontal)
//                                    .background(Color.blue.opacity(0.2))
//                                    .cornerRadius(10)
//                                Spacer()
//                            }
//                    VStack {
//                        Button(action: {
//                            Task{
//                                JuCManager.messages.append(Chat.Message(role: "user", content: messageText))
//                                await JuCManager.sendMessage()
//                                messageText = ""
//                            }
//                        }, label: {
//                            Text("Send")
//                        })
//                    }
//                }
//                .background(Color.primary.opacity(0.2).blur(radius: 10))
//            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(JuCManager: ChatViewModel())
    }
}

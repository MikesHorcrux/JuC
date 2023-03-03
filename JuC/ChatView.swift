//
//  ChatView.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import SwiftUI

struct ChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    @State private var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.messages, id: \.self) { message in
                        Text(message)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            HStack {
                TextField("Type a message...", text: $messageText)
                    .padding(8)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Button(action: {
                    Task{
                        await viewModel.sendMessage(messageText)
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

//
//  ChatViewModel.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import Foundation
import OpenAIKit

@MainActor
class JuCManager: ObservableObject {
    @Published var messages: [Chat.Message] = []
    let openAIManager = OpenAIManager()
    
    func sendMessage() async {
        do {
            let response = try await openAIManager.startChat(msg: messages)
            if let newMsg = response {
                self.messages.append(newMsg)
            }
        } catch let error as OpenAIKit.APIErrorResponse {
            print("OpenAI API error: \(error.error.message)")
            // handle the error condition here (e.g. show an error message to the user)
        } catch {
            print("Error: \(error.localizedDescription)")
            // handle other types of errors here (e.g. network errors)
        }
    }
}

extension Chat.Message: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .system(let content):
            hasher.combine("system")
            hasher.combine(content)
        case .user(let content):
            hasher.combine("user")
            hasher.combine(content)
        case .assistant(let content):
            hasher.combine("assistant")
            hasher.combine(content)
        }
    }

    public static func == (lhs: Chat.Message, rhs: Chat.Message) -> Bool {
        switch (lhs, rhs) {
        case (.system(let lhsContent), .system(let rhsContent)):
            return lhsContent == rhsContent
        case (.user(let lhsContent), .user(let rhsContent)):
            return lhsContent == rhsContent
        case (.assistant(let lhsContent), .assistant(let rhsContent)):
            return lhsContent == rhsContent
        default:
            return false
        }
    }
}

//
//  ChatViewModel.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import Foundation
import OpenAIKit

class ChatViewModel: ObservableObject {
    @Published var messages: [Chat.Message] = []
    let openAIManager = OpenAIManager()
    
//    func sendMessage(_ message: String) async {
//        messages.append(message)
//        do {
//            let response = try await openAIManager.generatePrompt(prompt: message)
//            DispatchQueue.main.async {
//                self.messages.append(response)
//            }
//        } catch let error as OpenAIKit.APIErrorResponse {
//            print("OpenAI API error: \(error.error.message)")
//            // handle the error condition here (e.g. show an error message to the user)
//        } catch {
//            print("Error: \(error.localizedDescription)")
//            // handle other types of errors here (e.g. network errors)
//        }
//    }
    
    func sendMessage() async {
        do {
            let response = try await openAIManager.startChat(msg: messages)
            DispatchQueue.main.async {
                if let newMsg = response{
                    self.messages.append(newMsg)
                }
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
        hasher.combine(role)
        hasher.combine(content)
    }

    public static func == (lhs: Chat.Message, rhs: Chat.Message) -> Bool {
        return lhs.role == rhs.role && lhs.content == rhs.content
    }
}

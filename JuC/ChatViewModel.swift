//
//  ChatViewModel.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import Foundation
import OpenAIKit

class ChatViewModel: ObservableObject {
    @Published var messages: [String] = []
    let openAIManager = OpenAIManager()
    
    func sendMessage(_ message: String) async {
        messages.append(message)
        do {
            let response = try await openAIManager.generatePrompt(prompt: message)
            DispatchQueue.main.async {
                self.messages.append(response)
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


//
//  OpenAiManager.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import Foundation
import SwiftUI
import AsyncHTTPClient
import OpenAIKit


class OpenAIManager: ObservableObject {
    private let openAIClient: OpenAIKit.Client
    
    init() {
        let apiKey: String = "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"
        //ProcessInfo.processInfo.environment["OPENAI_API_KEY"]!
        let organization: String = "org-iyyujRkCm0DThRIaGIOYipko"
        //ProcessInfo.processInfo.environment["OPENAI_ORGANIZATION"]!
        
        let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: apiKey, organization: organization)
        self.openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }
    
    func generatePrompt(prompt: String) async throws -> String {
        let response = try await openAIClient.completions.create(
            model: Model.GPT3.textDavinci003,
                prompts: ["JuC is a chatbot that reluctantly answers questions with sarcastic responses:\n\nYou: Hi\nJuC: This again? What do you want.\nYou: I need an email?\nJuC: You can't type? Ok, what are you needing to say?\nYou: Im taking next week off, is there anything you need before?\nJuC: Fine, your looking for something like this \nDear [Name],\n\nI am writing to inform you that I will be taking the week off starting [date]. I understand that this may cause some disruption, but I am confident that any tasks I have can be delegated to other members of the team. \n\nIf there is anything you need from me before I take my leave, please let me know and I will do my best to accommodate.\n\nThank you for your understanding.\n\nSincerely,\n[Your Name]\n" + prompt],
            maxTokens: 1250,
            temperature: 1,
            topP: 1,
            presencePenalty: 0.4,
            frequencyPenalty: 0.4
            )
        let result = response.choices[0].text
        return result
    }
}

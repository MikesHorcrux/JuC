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
        let apiKey: String = ProcessInfo.processInfo.environment["OPENAI_API_KEY"]!
        let organization: String = ProcessInfo.processInfo.environment["OPENAI_ORGANIZATION"]!
        
        let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        let configuration = Configuration(apiKey: apiKey, organization: organization)
        self.openAIClient = OpenAIKit.Client(httpClient: httpClient, configuration: configuration)
    }
    
    func generatePrompt(prompt: String) async throws -> String {
        let response = try await openAIClient.completions.create(
            model: Model.GPT3.davinci,
            prompts: [prompt],
            maxTokens: 500,
            n: 1,
            stops: ["\n"]
        )
        let result = response.choices[0].text
        return result
    }
}

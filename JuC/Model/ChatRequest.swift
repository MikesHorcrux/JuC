//
//  ChatRequest.swift
//  JuC
//
//  Created by Mike on 4/2/23.
//

import Foundation

struct ChatRequest: Request {
    typealias ReturnType = Message
    
    let method: HTTPMethod = .post
    let conversation: Conversation
    
    var path: String {
        "chats"
    }
    
    var bodyData: Data? {
        try? JSON.encoder.encode(conversation)
    }
}

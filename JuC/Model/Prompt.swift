//
//  Prompt.swift
//  JuC
//
//  Created by Mike on 4/26/23.
//

import Foundation
import FirebaseFirestoreSwift


struct Prompt: Codable, Equatable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var prompt: String
}

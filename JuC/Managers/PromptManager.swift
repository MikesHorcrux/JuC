//
//  PromptManager.swift
//  JuC
//
//  Created by Mike on 4/26/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class PromptManager: ObservableObject {
    @Published var prompts: [Prompt] = []
    private let db = Firestore.firestore()
    private let collectionName = "prompts"
    
    init() {
        let settings = Firestore.firestore().settings
        settings.isPersistenceEnabled = true
        Firestore.firestore().settings = settings
    }
    
    @MainActor
    func loadData() async {
        do {
            guard let userId = Auth.auth().currentUser?.uid else {
                print("No user ID found")
                return
            }
            let querySnapshot = try await db.collection(collectionName).document(userId).collection("SavedPrompts").getDocuments()
            prompts = querySnapshot.documents.compactMap { document in
                try? document.data(as: Prompt.self)
            }
            print(prompts)
            FirestoreLogger.logResult(.success(()), operation: "Load prompts")
        } catch {
            FirestoreLogger.logError(error, operation: "Load prompts")
        }
    }
    
    func addPrompt(prompt: Prompt) async {
        do {
            guard let userId = Auth.auth().currentUser?.uid else {
                print("No user ID found")
                return
            }
            let _ = try await db.collection(collectionName).document(userId).collection("SavedPrompts").addDocument(from: prompt)
            prompts.append(prompt)
            FirestoreLogger.logResult(.success(()), operation: "Add prompt")
        } catch {
            FirestoreLogger.logError(error, operation: "Add prompt")
        }
    }
    
    func updatePrompt(prompt: Prompt) async {
        if let promptID = prompt.id {
            do {
                guard let userId = Auth.auth().currentUser?.uid else {
                    print("No user ID found")
                    return
                }
                try await db.collection(collectionName).document(userId).collection("SavedPrompts").document(promptID).setData(from: prompt)
                FirestoreLogger.logResult(.success(()), operation: "Update prompt")
            } catch {
                FirestoreLogger.logError(error, operation: "Update prompt")
            }
        }
    }
    
    func deletePrompt(prompt: Prompt) async {
        if let promptID = prompt.id {
            do {
                guard let userId = Auth.auth().currentUser?.uid else {
                    print("No user ID found")
                    return
                }
                try await db.collection(collectionName).document(userId).collection("SavedPrompts").document(promptID).delete()
                prompts.removeAll { prompt in
                    prompt.id == promptID
                }
                FirestoreLogger.logResult(.success(()), operation: "Delete prompt")
            } catch {
                FirestoreLogger.logError(error, operation: "Delete prompt")
            }
        }
    }
}

//
//  ChatViewModel.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//
import Foundation
import Combine
import FirebaseAuth

@MainActor
class JuCManager: ObservableObject {
    @Published var messages: [Message] = [Message(content: "testing", role: "user")]
    let client: APIClient
    private var cancellables = [AnyCancellable]()
    private var user: User?
    
    init(client: APIClient) {
        self.client = client
        if let currentUser = Auth.auth().currentUser {
            self.user = currentUser
            fetchUserToken()
        } else {
            self.user = nil
        }
    }
    
    private func fetchUserToken() {
        user?.getIDToken(completion: { token, error in
            if let error = error {
                print("Error fetching user token: \(error.localizedDescription)")
            } else if let token = token {
                print("User token: \(token)")
                // You can now use the token as needed
                self.client.assign(accessToken: token)
                print(self.client.accessToken)
            }
        })
    }
    
    func sendConversation() {
        client
            .dispatch(ChatRequest(conversation: Conversation(messages: messages)))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                // Print identifiable error
                print(error)
            } receiveValue: { response in
                print(response)
                self.messages.append(response.messages.first!)
            }
            .store(in: &cancellables)
    }
}

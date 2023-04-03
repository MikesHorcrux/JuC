//
//  ChatViewModel.swift
//  JuC
//
//  Created by Mike on 2/26/23.
//

import Foundation
//import OpenAIKit
import Combine

@MainActor
//final class MatchesViewModel: ObservableObject {
//    let client: APIClient
//    private var cancellables = [AnyCancellable]()
//    init(client: APIClient) {
//        self.client = DefaultAPIClient.shared
//        }
    //    @Published var state = MatchesState()
    //
    //    private let client: APIClient
    //    private let auth: AuthSessionManager
    //    private var cancellables = [AnyCancellable]()
    //
    //    init(client: APIClient, auth: AuthSessionManager) {
    //        self.client = client
    //        self.auth = auth
    //    }
    //
    //    func fetchMatch(match: Match) {
    //        guard state.match != nil else {
    //            return
    //        }
    //        client
    //            .dispatch(GetMatch(match: match))
    //            .receive(on: DispatchQueue.main)
    //            .sink { [weak self] completion in
    //                guard case .failure(let error) = completion else { return }
    //                self?.state.error = error.identifiable
    //            } receiveValue: { [self] response in
    //                state.match = response
    //                print(self.state.match ?? "Match is nil")
    //                // Todo: what do we do with this call
    //            }
    //            .store(in: &cancellables)
    //    }
    //
    //    func createMatch(userId: Int?, trainerId: Int) {
    //        guard let id = userId else {
    //            return
    //        }
    //        self.state.following.append(Match(id: 0, created: Date(), user: trainerId, owner: id))
    //        client
    //            .dispatch(PostMatch(match: Match(user: trainerId, owner: id)))
    //            .receive(on: DispatchQueue.main)
    //            .sink { [weak self] completion in
    //                guard case .failure(let error) = completion else { return }
    //                self?.state.error = error.identifiable
    //            } receiveValue: { _ in }
    //            .store(in: &cancellables)
    //    }
    //
    //    private func updateMatch(match: Match) -> AnyPublisher<Match, Error> {
    //        return client
    //            .dispatch(UpdateMatch(match: match))
    //            .mapError { $0 as Error }
    //            .eraseToAnyPublisher()
    //    }
    //
    //    func deleteMatch(match: Int) {
    //        self.state.following = self.state.following.filter {$0.id != match}
    //        return client
    //            .dispatch(DeleteMatch(id: match))
    //            .receive(on: DispatchQueue.main)
    //            .sink { [weak self] completion in
    //                guard case .failure(let error) = completion else { return }
    //                self?.state.error = error.identifiable
    //            } receiveValue: { [weak self] results in
    //                print(results)
    //            }
    //            .store(in: &cancellables)
    //    }
    //
    //    func fetchFollowing() {
    //        state.followedResults.removeAll()
    //        state.followed.removeAll()
    //
    //        client
    //            .dispatch(GetFollowing())
    //            .receive(on: DispatchQueue.main)
    //            .sink { [weak self] completion in
    //                guard case .failure(let error) = completion else { return }
    //                self?.state.error = error.identifiable
    //            } receiveValue: { [weak self] results in
    //                self?.appendFollowing(results)
    //            }
    //            .store(in: &cancellables)
    //    }
    //
    //    private func appendFollowing(_ page: Matches) {
    //        state.followedResults.append(page)
    //        state.followed.append(contentsOf: page.results)
    //    }
    //
    //    func fetchFollowers() {
    //        state.followersResults.removeAll()
    //        state.followers.removeAll()
    //
    //        client
    //            .dispatch(GetFollowers())
    //            .receive(on: DispatchQueue.main)
    //            .sink { [weak self] completion in
    //                guard case .failure(let error) = completion else { return }
    //                self?.state.error = error.identifiable
    //            } receiveValue: { [weak self] results in
    //                self?.appendFollowers(results)
    //            }
    //            .store(in: &cancellables)
    //    }
    //
    //    private func appendFollowers(_ page: Matches) {
    //        state.followersResults.append(page)
    //        state.followers.append(contentsOf: page.results)
    //    }
    //
    //    func fetchFollowingIdList() {
    //        client
    //            .dispatch(GetFollowingIds())
    //            .receive(on: DispatchQueue.main)
    //            .sink { [weak self] completion in
    //                guard case .failure(let error) = completion else { return }
    //                self?.state.error = error.identifiable
    //            } receiveValue: { [weak self] results in
    //                self?.appendFollowingList(results)
    //            }
    //            .store(in: &cancellables)
    //    }
    //
    //    private func appendFollowingList(_ page: MatchesID) {
    //        state.followingResults.append(page)
    //        state.following.append(contentsOf: page.results)
    //    }
    //    func resetFollowingList() {
    //        state.following.removeAll()
    //        state.followingResults.removeAll()
    //    }
    //}
class JuCManager: ObservableObject {
    @Published var messages: [Message] = [Message(content: "testing", role: "user")]
    let client: APIClient
    private var cancellables = [AnyCancellable]()
    
    init(client: APIClient) {
        self.client = client
        }
    
    func sendConverstation() {
            client
                .dispatch(ChatRequest(conversation: Conversation(messages: messages)))
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    guard case .failure(let error) = completion else { return }
//                    print() error.identifiable
                    print(error)
                } receiveValue: { response in
                   print(response)
                    self.messages.append(response.messages.first!)
                }
                .store(in: &cancellables)
        }
//    func sendMessage() async {
//        do {
//            let response = try await openAIManager.startChat(msg: messages)
//            if let newMsg = response {
//                self.messages.append(newMsg)
//            }
//        } catch let error as OpenAIKit.APIErrorResponse {
//            print("OpenAI API error: \(error.error.message)")
//            // handle the error condition here (e.g. show an error message to the user)
//        } catch {
//            print("Error: \(error.localizedDescription)")
//            // handle other types of errors here (e.g. network errors)
//        }
//    }
}

//extension Chat.Message: Hashable {
//    public func hash(into hasher: inout Hasher) {
//        switch self {
//        case .system(let content):
//            hasher.combine("system")
//            hasher.combine(content)
//        case .user(let content):
//            hasher.combine("user")
//            hasher.combine(content)
//        case .assistant(let content):
//            hasher.combine("assistant")
//            hasher.combine(content)
//        }
//    }
//
//    public static func == (lhs: Chat.Message, rhs: Chat.Message) -> Bool {
//        switch (lhs, rhs) {
//        case (.system(let lhsContent), .system(let rhsContent)):
//            return lhsContent == rhsContent
//        case (.user(let lhsContent), .user(let rhsContent)):
//            return lhsContent == rhsContent
//        case (.assistant(let lhsContent), .assistant(let rhsContent)):
//            return lhsContent == rhsContent
//        default:
//            return false
//        }
//    }
//}

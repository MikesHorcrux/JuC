import SwiftUI
import OpenAIKit

struct ChatView: View {
    @ObservedObject var jucManager: JuCManager
    private let cornerRadius: CGFloat = 35.0
    @State private var sheetPosition: SheetPosition = .minimized
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack {
                        if jucManager.messages.isEmpty {
                            Spacer()
                            Text("No messages")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Spacer()
                        } else {
                            VStack(spacing: 20) {
                                ForEach(Array(jucManager.messages.enumerated()), id: \.offset) { index, message in
                                    HStack {
                                        switch message {
                                        case .user(let content):
                                            Spacer()
                                            UserChatBubble(msg: content)
                                        case .assistant(let content):
                                            JuCChatBubble(msg: content)
                                            Spacer()
                                        default:
                                            EmptyView()
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 100)
                }
                .onChange(of: jucManager.messages) { _ in
                    let lastIndex = jucManager.messages.count - 1
                    if lastIndex >= 0 {
                        scrollView.scrollTo(lastIndex, anchor: .bottom)
                    }
                }
            }
            .padding(.bottom, 100)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(jucManager: JuCManager())
    }
}

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
                                        if message.role == "user"{
                                            Spacer()
                                            UserChatBubble(msg: message.content)
                                        } else {
                                            JuCChatBubble(msg: message.content)
                                            Spacer()
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

#if DEBUG
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(jucManager: JuCManager(client: InMemoryAPIClient()))
    }
}
#endif

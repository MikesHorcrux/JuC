import SwiftUI
import OpenAIKit

struct ChatView: View {
    @ObservedObject var jucManager: JuCManager
    private let cornerRadius: CGFloat = 35.0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollViewReader { scrollView in
                ScrollView {
                    if jucManager.messages.isEmpty {
                        VStack {
                            Spacer()
                            Text("No messages")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        VStack(spacing: 20) {
                            ForEach(Array(jucManager.messages.enumerated()), id: \.offset) { index, message in
                                HStack {
                                    if message.role == "user" {
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
                .padding(.bottom,145)
                .background(RoundedRectangle(cornerRadius: cornerRadius)
                                .fill(Color(.systemBackground)))
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .onChange(of: jucManager.messages) { _ in
                    let lastIndex = jucManager.messages.count - 1
                    if lastIndex >= 0 {
                        scrollView.scrollTo(lastIndex, anchor: .bottom)
                    }
                }
            }
        }
        .padding(.top, 60)
        .padding(.bottom, -35)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(jucManager: JuCManager())
    }
}

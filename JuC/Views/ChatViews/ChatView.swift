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
                .padding(.bottom,150)
                .onChange(of: jucManager.messages) { _ in
                    let lastIndex = jucManager.messages.count - 1
                    if lastIndex >= 0 {
                        scrollView.scrollTo(lastIndex, anchor: .bottom)
                    }
                }
            }
            BottomSheetView(sheetPosition: $sheetPosition, maxHeight: 500) {
                TextEntryView(jucManager: jucManager, sheetSize: $sheetPosition)
                    .padding(.bottom, 45)
            }
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(jucManager: JuCManager())
    }
}

//
//  TextEntryView.swift
//  JuC
//
//  Created by Mike on 3/13/23.
//

import SwiftUI
import OpenAIKit

struct TextEntryView: View {
    @ObservedObject var JuCManager: ChatViewModel
    @FocusState private var fieldIsFocused: Bool
    @State var textEntry: String = ""
    @State var size = 0.1
    @Binding var sheetSize: SheetPosition
    var body: some View {
        VStack{
            HStack {
                VStack {
                    TextEditor(text: $textEntry)
                        .scrollContentBackground(.hidden)
                        .focused($fieldIsFocused)
                }
                .padding(2)
                .background(Color("DarkPurple"))
                .cornerRadius(20)
                .padding()
                .onTapGesture {
                    sheetSize = .maximized
                }
                
                VStack {
                    Spacer()
                    Button {
                        sheetSize = .minimized
                            Task{
                                JuCManager.messages.append(Chat.Message(role: "user", content: textEntry))
                                textEntry = ""
                                dismissKeyboard(true)
                                await JuCManager.sendMessage()
                                
                            }
                    } label: {
                        Image(systemName: "arrow.up")
                            .fontWeight(.semibold)
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color("DarkPurple"))
                            .clipShape(Circle())
                            .padding()
                }
                }
                
            }
        }
    }
}

struct TextEntryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Text("hey")
        }
        .fullScreenCover(isPresented: .constant(true)) {
            TextEntryView(JuCManager: ChatViewModel(), sheetSize: .constant(.minimized))
                .preferredColorScheme(.dark) // Force dark mode for the entire app
        }
    }
}

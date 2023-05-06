//
//  TextEntryView.swift
//  JuC
//
//  Created by Mike on 3/13/23.
//

import SwiftUI
import OpenAIKit

struct TextEntryView: View {
    @EnvironmentObject var keyboardState: KeyboardState
    @ObservedObject var jucManager: JuCManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TextField("Hey JuC...", text: $jucManager.textEntry, prompt: Text("Hey JuC..."), axis: .vertical)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color("OxfordBlue"))
                    .cornerRadius(20)
                    .padding(.trailing, 80)
                    .padding(30)
            }
            HStack {
                Spacer()
                HStack {
                    if keyboardState.isKeyboardVisible {
                        Button {
                            dismissKeyboard()
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down.fill")
                                .fontWeight(.semibold)
                                .font(.body)
                                .foregroundColor(Color("SilverLakeBlue"))
                                .padding(5)
                                .background(Color("BottomSheet"))
                                .clipShape(Circle())
                               // .padding()
                        }
                    }
                    
                    Button {
                        Task {
                            jucManager.messages.append(Message(content: jucManager.textEntry, role: "user"))
                            jucManager.textEntry = ""
                            dismissKeyboard()
                            jucManager.sendConversation()
                        }
                    } label: {
                        Image(systemName: "arrow.up")
                            .fontWeight(.semibold)
                            .font(.body)
                            .foregroundColor(Color("SilverLakeBlue"))
                            .padding(5)
                            .background(Color("BottomSheet"))
                            .clipShape(Circle())
                            //.padding()
                    }
                }
                .padding([.trailing, .bottom],30)
            }
        }
        .padding(.bottom, 50)
        .background(Color("RichBlack"))
        .cornerRadius(25)
        .padding(.bottom, -60)
    }
}

#if DEBUG
struct TextEntryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            TextEntryView(jucManager: JuCManager(client: InMemoryAPIClient()))
        }
    }
}
#endif



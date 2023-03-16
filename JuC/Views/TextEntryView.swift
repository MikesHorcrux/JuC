//
//  TextEntryView.swift
//  JuC
//
//  Created by Mike on 3/13/23.
//

import SwiftUI
import OpenAIKit

struct TextEntryView: View {
    @ObservedObject var jucManager: JuCManager
    @FocusState private var fieldIsFocused: Bool
    @State var textEntry: String = ""
    @State var size = 0.1
    @Binding var sheetSize: SheetPosition
    @State var haveTextPrompt: Bool = true
    var body: some View {
        VStack{
            HStack {
                VStack {
                          TextEditor(text: $textEntry)
                              .scrollContentBackground(.hidden)
                              .padding(5)
//                              .overlay(
//                                  Group {
//                                      if textEntry.isEmpty || haveTextPrompt {
//                                          VStack {
//                                              Text("Ask JuC for help with professional communication...")
//                                                  .foregroundColor(.gray)
//                                              .padding()
//                                              .padding(.top, 5)
//                                              Spacer()
//                                          }
//                                      }
//                                  }
//                              )
                      }
                      .padding(2)
                      .background(Color("DarkPurple"))
                      .cornerRadius(20)
                      .padding()
                .onTapGesture {
                    sheetSize = .maximized
                    haveTextPrompt.toggle()
                }
                
                VStack {
                    if sheetSize != .minimized {
                        Spacer()
                    }
                    Button {
                        sheetSize = .minimized
                        Task{
                            jucManager.messages.append(Chat.Message(role: "user", content: textEntry))
                            textEntry = ""
                            dismissKeyboard(true)
                            await jucManager.sendMessage()
                            haveTextPrompt.toggle()
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
                    if sheetSize == .minimized {
                        Spacer()
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
    }
}

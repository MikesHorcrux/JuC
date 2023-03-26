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
    @State var textEntry: String = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TextField("Hey JuC...", text: $textEntry, axis: .vertical)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color("OxfordBlue"))
                    .cornerRadius(20)
                    .padding(.trailing, 100)
                    .padding(30)
            }
            HStack {
                Spacer()
                Button {
                    Task {
                        jucManager.messages.append(Chat.Message.user(content: textEntry))
                        textEntry = ""
                        dismissKeyboard(true)
                        await jucManager.sendMessage()
                    }
                } label: {
                    Image(systemName: "arrow.up")
                        .fontWeight(.semibold)
                        .font(.title)
                        .foregroundColor(Color("SilverLakeBlue"))
                        .padding()
                        .background(Color("BottomSheet"))
                        .clipShape(Circle())
                        .padding()
            }
            }
        }
        .padding(.bottom, 50)
        .background(Color("RichBlack"))
        .cornerRadius(25)
        .padding(.bottom, -60)
    }
}

struct TextEntryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            TextEntryView(jucManager: JuCManager())
        }
    }
}

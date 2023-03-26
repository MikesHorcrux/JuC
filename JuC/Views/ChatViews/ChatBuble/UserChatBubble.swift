//
//  UserChatBubble.swift
//  JuC
//
//  Created by Mike on 3/12/23.
//

import SwiftUI

struct UserChatBubble: View {
    var msg: String = ""
    var body: some View {
        ChatBubble(direction: .right) {
            Text(msg)
                .multilineTextAlignment(.leading)
                .padding(.all, 20)
                .foregroundColor(Color.white)
                .background(Color("OxfordBlue"))
                .textSelection(.enabled)
        }
        .padding(.leading, 30)
        
    }
}

struct UserChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            UserChatBubble()
            UserChatBubble(msg: "Hey...")
            UserChatBubble(msg: "Harry, Ron, and Hermione were all sitting in the Gryffindor common room one day when they started talking about their favorite types of magic.")
        }
    }
}

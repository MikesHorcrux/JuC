//
//  JuCChatBubble.swift
//  JuC
//
//  Created by Mike on 3/12/23.
//

import SwiftUI

struct JuCChatBubble: View {
    var msg: String = ""
    var body: some View {
        ChatBubble(direction: .left) {
            Text(msg)
                .multilineTextAlignment(.leading)
                .padding(.all, 20)
                .foregroundColor(Color.white)
                .background(Color("SpaceCadet"))
                .textSelection(.enabled)
        }
        .padding(.trailing, 30)
        
    }
}

struct JuCChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            JuCChatBubble(msg: "testing if this look good or not I have no clue")
        }
    }
}

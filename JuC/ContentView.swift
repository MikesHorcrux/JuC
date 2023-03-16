//
//  ContentView.swift
//  JuC
//
//  Created by Mike on 2/25/23.
//

import SwiftUI
import Foundation
import OpenAIKit

struct ContentView: View {
    @State private var sheetPosition: SheetPosition = .minimized
    @StateObject var JuCManager = ChatViewModel()
    
    var body: some View {
        ZStack {
            ChatView(JuCManager: JuCManager)
            BottomSheetView(sheetPosition: $sheetPosition, maxHeight: 500) {
                TextEntryView(JuCManager: JuCManager, sheetSize: $sheetPosition)
                    .padding(.bottom, 45)
            }
            .padding(.bottom, -45)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


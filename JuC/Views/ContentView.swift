//
//  ContentView.swift
//  JuC
//
//  Created by Mike on 2/25/23.
//

import SwiftUI
import Foundation
import OpenAIKit
import KeyboardObserving

struct ContentView: View {
   
    @State var chatSheetPosition: SheetPositionWithDismiss = .maximized
    @StateObject var jucManager = JuCManager()
    @EnvironmentObject var keyboard: Keyboard
    
    var body: some View {
        ZStack {
            BottomSheetWithDismissView(sheetPosition: .constant(chatSheetPosition), maxHeight: keyboard.state.height == 0 ? UIScreen.main.bounds.height - 80 : UIScreen.main.bounds.height - 360) {
                ChatView(jucManager: jucManager)
            }
            .padding(.bottom, keyboard.state.height == 0 ? -UIApplication.shared.windows.first!.safeAreaInsets.bottom : -40)
        }
        .keyboardObserving()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Keyboard())
    }
}

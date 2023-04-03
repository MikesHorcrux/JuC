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
    @State var showTextfield: Bool = true
    @State var chatSheetPosition: SheetPositionWithDismiss = .maximized
    @StateObject var jucManager = JuCManager(client: DefaultAPIClient.shared)
    
    var body: some View {
        ZStack {
            MainView(showTextfield: $showTextfield, chatSheetPosition: $chatSheetPosition)
            BottomSheetWithDismissView(sheetPosition: $chatSheetPosition, maxHeight: UIScreen.main.bounds.height - 140) {
                ChatView(jucManager: jucManager)
            }
            .edgesIgnoringSafeArea(.bottom)
            if showTextfield {
                VStack {
                Spacer()
                if chatSheetPosition == .dissMissed {
                    Button {
                        chatSheetPosition = .maximized
                    } label: {
                        Image(systemName: "lines.measurement.horizontal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("OxfordBlue"))
                            .clipShape(Circle())
                    }
                }
                TextEntryView(jucManager: jucManager)
                    .onTapGesture {
                        if chatSheetPosition != .maximized {
                            chatSheetPosition = .maximized
                        }
                    }
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  JuC
//
//  Created by Mike on 2/25/23.
//

import SwiftUI
import Foundation
import OpenAIKit
import Firebase

struct ContentView: View {
    @State var showTextfield: Bool = true
    @State var chatSheetPosition: SheetPositionWithDismiss = .dissMissed
    @StateObject var jucManager = JuCManager(client: DefaultAPIClient.shared)
    
    var body: some View {
        ZStack {
            MainView(jucManager: jucManager, showTextfield: $showTextfield, chatSheetPosition: $chatSheetPosition)
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
        .onAppear {
            // Log the ContentView screen view event to Google Analytics
            Analytics.logEvent(AnalyticsEventScreenView, parameters: [
                AnalyticsParameterScreenName: "ContentView",
                AnalyticsParameterScreenClass: "ContentView"
            ])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

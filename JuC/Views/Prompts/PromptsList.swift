//
//  PromptsList.swift
//  JuC
//
//  Created by Mike on 4/27/23.
//

import SwiftUI

struct PromptsList: View {
    @StateObject var promptManager: PromptManager = PromptManager()
    @ObservedObject var jucManager: JuCManager
    @State var showPrompEntryView: Bool = false
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                Button {
                    showPrompEntryView.toggle()
                } label: {
                    Image(systemName: "plus.app.fill")
                        .font(.title)
                        .foregroundColor(.primary.opacity(0.8))
                        .padding(5)
                }
                
                ForEach(promptManager.prompts) { prompt in
                    PromptButton(jucManager: jucManager, prompt: prompt, promptManager: promptManager)
                        .padding(5)
                }
            }
        }
        .onAppear {
            Task {
                if promptManager.prompts.isEmpty {
                    await promptManager.loadData()
                }
            }
        }
        .fullScreenCover(isPresented: $showPrompEntryView) {
            PromptEntryView(promptManager: promptManager)
        }
    }
}

struct PromptsList_Previews: PreviewProvider {
    static var previews: some View {
        PromptsList(jucManager: JuCManager(client: InMemoryAPIClient()))
    }
}

//
//  PromptEntryView.swift
//  JuC
//
//  Created by Mike on 4/28/23.
//

import SwiftUI

struct PromptEntryView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var promptManager: PromptManager
    @State private var title: String = ""
    @State private var prompt: String = "JuC Build an email template...."
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Prompt Title")) {
                    TextField("Enter prompt title", text: $title)
                        .foregroundColor(.primary.opacity(0.9))
                }
                Section(header: Text("Prompt")) {
                    TextEditor(text: $prompt)
                        .frame(height: 250)
                        .foregroundColor(.primary.opacity(0.9))
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                if prompt == "JuC Build an email template...." {
                                    prompt = ""
                                }
                            }
                        }
                    
                }
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(.white.opacity(0.7))
            .background(Color("YinMinBlue"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Create a prompt")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            await promptManager.addPrompt(prompt: Prompt(title: title, prompt: prompt))
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.title)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                            dismiss()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.title)
                    }
                    
                }
            }
        }
    }
}

struct PromptEntryView_Previews: PreviewProvider {
    static var previews: some View {
        PromptEntryView(promptManager: PromptManager())
    }
}

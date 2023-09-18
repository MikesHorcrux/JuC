//
//  PromptButton.swift
//  JuC
//
//  Created by Mike on 4/20/23.
//

import SwiftUI
import Firebase

struct PromptButton: View {
    @ObservedObject var jucManager: JuCManager
    var prompt: Prompt
    @ObservedObject var promptManager: PromptManager
    @State private var rotationAngle: Double = 0
    @State private var animating = false
    @GestureState private var isLongPressed = false

    var body: some View {
        ZStack(alignment: .topLeading){
            
            Button(action: {
                if !isLongPressed {
                    if !animating {
                        jucManager.textEntry = prompt.prompt
                        // Log the button press event to Google Analytics
                        Analytics.logEvent("prompt_button_pressed", parameters: [
                            "prompt_title": prompt.title,
                            "prompt_text": prompt.prompt
                        ])
                    }else {
                        Task{
                            await promptManager.deletePrompt(prompt: prompt)
                        }
                    }
                }
            }) {
                Text(prompt.title)
            }
            .buttonStyle(PillButtonStyle())
            .rotationEffect(.degrees(rotationAngle))
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($isLongPressed) { value, state, transaction in
                        state = value
                    }
                    .onEnded { value in
                        if value {
                            animating.toggle()
                            if animating {
                                startJiggleAnimation()
                            } else {
                                stopJiggleAnimation()
                            }
                        }
                    }
            )
            if animating {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
                    .padding(-5)
            }
        }
    }

    private func startJiggleAnimation() {
        let rotationStep = 3.0

        withAnimation(Animation.easeInOut(duration: 0.2).repeatForever(autoreverses: true)) {
            rotationAngle += rotationStep
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(Animation.easeInOut(duration: 0.2).delay(0.2).repeatForever(autoreverses: true)) {
                rotationAngle += -2 * rotationStep
            }
        }
    }

    private func stopJiggleAnimation() {
        withAnimation(.easeInOut(duration: 0.1)) {
            rotationAngle = 0
        }
    }
}

#if DEBUG
struct PromptButton_Previews: PreviewProvider {
    static var previews: some View {
        PromptButton(jucManager: JuCManager(client: InMemoryAPIClient()), prompt: Prompt(title: "test", prompt: "test"), promptManager: PromptManager())
    }
}
#endif

//
//  EmailSignUpView.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import SwiftUI

struct EmailSignUpView: View {
    @State private var isSignIn = true
        
        var body: some View {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.secondary)
                    VStack{
                        JuCChatBubble(msg: "Psst, it's JuC! Wanna jazz up your work talk? Log in or sign up, and let's conquer the communication world together!")
                        UserChatBubble(msg: "...")
                    }
                }
                .frame(height: 300)
                if isSignIn {
                    SignInView()
                } else {
                    LoginView()
                }
                Spacer()
                Button(action: {
                    isSignIn.toggle()
                }) {
                    Text(isSignIn ? "Switch to Login" : "Switch to Sign In")
                        .foregroundColor(Color("YinMinBlue"))
                        .fontWeight(.bold)
                }
                .padding()
            }
            .padding()
        }
}

struct EmailSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSignUpView()
    }
}

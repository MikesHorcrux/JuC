//
//  AuthView.swift
//  JuC
//
//  Created by Mike on 3/16/23.
//

import SwiftUI
import AuthenticationServices

struct AuthView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State var sheetPosition: SheetPositionWithDismiss = .dissMissed
    var body: some View {
        ZStack {
            RepeatingPlayer()
                .edgesIgnoringSafeArea(.all)
            VStack{
               viewContent
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            BottomSheetWithDismissView(sheetPosition: $sheetPosition, maxHeight: UIScreen.main.bounds.height - 80) {
                EmailSignUpView()
            }
            .padding(.bottom, -18)
            //.background(Color("SilverLakeBlue").edgesIgnoringSafeArea(.all))
        }
    }
    
    private var viewContent: some View {
        VStack{
            Text("Welcome to JuC - Unleash Your Communication Superpowers!")
                .foregroundColor(Color("Platinum"))
                .font(.title)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
            HStack {
                Spacer()
                Text("It's time to discover the untapped potential of the human species when it comes to professional communication. With JuC, your AI-powered confidant, you're about to embark on a journey to greatness.")
                    .foregroundColor(Color("Platinum"))
                    .font(.title2)
                    .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
            }
            .padding()
            Spacer()
            Button("Continue with Email") {
                sheetPosition = .maximized
            }
            .buttonStyle(RoundedCornerButtonStyle())
            SignInWithAppleButton { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let authorization):
                    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                        Task {
                            await authManager.authorizationController(controller: nil, didCompleteWithAuthorization: authorization)
                        }
                    }
                case .failure(let error):
                    authManager.error = error
                }
            }
            .frame(width: 300, height: 50)
            .padding(.top, 16)
            Spacer()
        }
    }
}



struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

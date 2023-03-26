//
//  SignInView.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Sign Up")
                    .font(.largeTitle)
                Spacer()
            }
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button(action: {
                Task {
                    await authManager.createAccount(email: email, password: password)
                }
            }) {
                if authManager.isAuthenticating {
                    ProgressView()
                } else {
                    Text("Sign In")
                }
            }
            .buttonStyle(RoundedCornerButtonStyle())
            .padding(.top, 60)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

//
//  LogInView.swift
//  JuC
//
//  Created by Mike on 3/18/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Login")
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
            
            Button(action: {
                Task{
                    await authManager.signInWithEmail(email: email, password: password)
                }
            }) {
                if authManager.isAuthenticating {
                    ProgressView()
                } else {
                    Text("Login")
                }
            }
            .buttonStyle(RoundedCornerButtonStyle())
            .padding(.top, 60)
        }
    }
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

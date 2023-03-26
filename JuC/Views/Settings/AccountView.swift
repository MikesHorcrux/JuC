//
//  AccountView.swift
//  JuC
//
//  Created by Mike on 3/19/23.
//

import SwiftUI

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var showAlert = false
    
    var body: some View {
        List {
            Section {
                Button("Sign Out") {
                    authManager.signOut()
                    authManager.user = nil
                }
                .foregroundColor(.primary)

                Button("Delete Account") {
                    showAlert.toggle()
                }
                .foregroundColor(Color.red)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Delete Account"),
                          message: Text("Are you sure you want to delete your account? This action cannot be undone."),
                          primaryButton: .destructive(Text("Delete")) {
                        authManager.deleteUser()
                    },
                          secondaryButton: .cancel())
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(AuthenticationManager())
    }
}


//
//  LoginView.swift
//  XCTestApp
//
//  Created by Navya Vohra on 2025-03-02.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            TextField("Username", text: $authViewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $authViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                authViewModel.login()
            }) {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            NavigationLink(destination: HomeView(), isActive: $authViewModel.isAuthenticated) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}

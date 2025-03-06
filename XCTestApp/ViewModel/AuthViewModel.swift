//
//  AuthViewModel.swift
//  XCTestApp
//
//  Created by Navya Vohra on 2025-03-02.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?

    func login() {
        guard !username.isEmpty, !password.isEmpty else {
            errorMessage = "Username and Password cannot be empty"
            return
        }
        
        // Simulated API Authentication
        if username == "TestUser" && password == "Password123" {
            isAuthenticated = true
        } else {
            errorMessage = "Invalid credentials"
        }
    }
}

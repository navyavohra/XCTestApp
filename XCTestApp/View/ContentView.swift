//
//  ContentView.swift
//  XCTestApp
//
//  Created by Navya Vohra on 2025-03-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Login", destination: LoginView())
                NavigationLink("Home", destination: HomeView())
            }
            .navigationTitle("XCTestApp")
        }
    }
}

#Preview {
    ContentView()
}

//
//  HomeView.swift
//  XCTestApp
//
//  Created by Navya Vohra on 2025-03-02.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            NavigationLink("Item 1", destination: DetailView(item: "Item 1"))
            NavigationLink("Item 2", destination: DetailView(item: "Item 2"))
        }
        .navigationTitle("Home")
    }
}

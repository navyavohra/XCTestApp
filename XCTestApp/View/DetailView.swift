//
//  DetailView.swift
//  XCTestApp
//
//  Created by Navya Vohra on 2025-03-02.
//

import SwiftUI

struct DetailView: View {
    let item: String
    var body: some View {
        Text("Details of \(item)")
            .navigationTitle("Details")
    }
}

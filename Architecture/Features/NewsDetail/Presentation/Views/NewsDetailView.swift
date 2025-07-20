//
//  NewsDetailView.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

// MARK: - Entry Point

import SwiftUI

struct NewsDetailView: View {
    private let composer = NewsDetailComposer()
    
    var body: some View {
        NewsDetailFlow(
            detail: composer.compose
        )
    }
}

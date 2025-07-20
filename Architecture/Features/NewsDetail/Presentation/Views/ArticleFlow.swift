//
//  ArticleFlow.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

struct ArticleFlow<ArticleCard: View>: View {
    @State private var state: NewsState
    private let articleCard: (NewsState) -> ArticleCard
    
    init(
        state: NewsState,
        articleCard: @escaping (NewsState) -> ArticleCard
    ) {
        self.state = state
        self.articleCard = articleCard
    }
    
    var body: some View {
        self.articleCard(state)
    }
}

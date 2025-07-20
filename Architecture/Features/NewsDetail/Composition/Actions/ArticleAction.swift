//
//  ArticleAction.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

struct ArticleAction {
    private let state: NewsState
    private let articleUseCase: ArticleUseCase
    
    init(
        state: NewsState,
        articleUseCase: ArticleUseCase
    ) {
        self.state = state
        self.articleUseCase = articleUseCase
    }
    
    @MainActor
    func execute() async {
        do {
            let articles = try await articleUseCase.getArticles()
            state.articles = articles
        } catch {
            print("Failed to fetch articles: \(error)")
        }
    }
}

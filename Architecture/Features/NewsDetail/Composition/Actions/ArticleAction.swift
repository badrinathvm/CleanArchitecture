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
    func execute(loadMore: Bool = false) async {
        // Shows the loading indicator.
        state.isLoading = true
        // Ensure loading state is reset regardless of success/failure
        defer {
            state.isLoading = false
        }
        do {
            let articles = try await articleUseCase.getArticles()
            if loadMore {
                if let lastArticle = articles.last {
                    state.articles.append(lastArticle)
                }
            } else {
                state.articles = articles
            }
        } catch {
            print("Failed to fetch articles: \(error)")
        }
    }
}

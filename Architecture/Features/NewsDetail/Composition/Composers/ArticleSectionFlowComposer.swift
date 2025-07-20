//
//  ArticleSectionFlowComposer.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

// MARK: - Section Composer
struct ArticleSectionFlowComposer {
    static var articleRepository : ArticleInterface = {
        let repository = ArticleRepository(service: ArticleService())
        return ArticleDecorator(
            logger: ConsoleLogger(),
            repository: repository
        )
    }()
    
    static func compose(_ state: NewsState) -> ArticleFlow<ArticleCard> {
        ArticleFlow(
            state: state,
            articleCard: { state in
                // create action
                let action = ArticleAction(
                    state: state,
                    articleUseCase: ArticleUseCase(
                        repository: articleRepository
                    )
                )
                
                return ArticleCard(
                    state: state,
                    onLoad: {
                        Task {
                            await action.execute()
                        }
                    }
                )
            }
        )
    }
}

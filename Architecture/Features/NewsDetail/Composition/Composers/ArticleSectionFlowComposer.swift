//
//  ArticleSectionFlowComposer.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

struct ArticleFactory {
    static func useCase() -> ArticleUseCase {
        let repository = ArticleRepository(service: ArticleService(), mapper: ArticleResponseMapper())
        let decorator = ArticleDecorator(logger: ConsoleLogger(), repository: repository)
        return ArticleUseCase(datasource: decorator)
    }
}

// MARK: - Section Composer

struct ArticleSectionFlowComposer {
    static func compose(_ state: NewsState) -> ArticleFlow<ArticleCard> {
        ArticleFlow(
            state: state,
            articleCard: { state in
                // create action
                let action = ArticleAction(
                    state: state,
                    usecase: ArticleFactory.useCase()  // ✅ Use factory result directly
                )
                
                return ArticleCard(
                    state: state,
                    onLoad: {
                        Task {
                            await action.execute()
                        }
                    },
                    onLoadMore: {
                        Task {
                            await action.execute(loadMore: true)
                        }
                    }
                )
            }
        )
    }
}

//
//  ArticleDecorator.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

/**
     ArticleServiceDecorator (with logging, analytics, performance tracker)
         ↓
     ArticleRepository (data access layer)
         ↓
     ArticleService (API calls)
 */


struct ArticleDecorator: ArticleInterface {
    private let logger: LoggerInterface
    private let repository: ArticleInterface
    
    init(
        logger: LoggerInterface,
        repository: ArticleInterface
    ) {
        self.logger = logger
        self.repository = repository
    }
    
    func getArticles() async throws -> [Article] {
        logger.log("Getting articles...")
        return try await repository.getArticles()
    }
}

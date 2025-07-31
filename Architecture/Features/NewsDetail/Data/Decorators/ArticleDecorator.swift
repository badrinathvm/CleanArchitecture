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

/*  Common Cross Custting concerns - Theyt Spans across multiple modules.
 Logging, Caching, Retry, Performance, Analytics, Security Transaction Managment
 */

struct ArticleDecorator: ArticleRepositoryInterface {
    private let logger: LoggerInterface
    private let repository: ArticleRepositoryInterface
    
    init(
        logger: LoggerInterface,
        repository: ArticleRepositoryInterface
    ) {
        self.logger = logger
        self.repository = repository
    }
    
    func getArticles() async throws -> [Article] {
        do {
            logger.logInfo("Getting articles...")
            let articles = try await repository.getArticles()
            logger.logInfo("Fetched articles successfully")
            return articles
        } catch  {
            logger.logError(error.localizedDescription)
            throw error
        }
    }
}



//
//  RetryDecorator.swift
//  Architecture
//
//  Created by Rani Badri on 7/30/25.
//

// Cross- cutting concernes via decorator
struct RetryDecorator: ArticleRepostoryInterface {
    private let repository: ArticleRepository
    private let maxRetries: Int
    
    init(
        maxRetries: Int = 3,
        repository: ArticleRepository
    ) {
        self.maxRetries = maxRetries
        self.repository = repository
    }
    
    func getArticles() async throws -> [Article] {
        for attempt in 1...maxRetries {
            do {
                return try await repository.getArticles()
            } catch {
                if attempt == maxRetries {
                    throw error
                }
                try await Task.sleep(nanoseconds: UInt64(attempt * 1_000_000_000))
            }
        }
        fatalError("Should never reach here")
    }
    
}

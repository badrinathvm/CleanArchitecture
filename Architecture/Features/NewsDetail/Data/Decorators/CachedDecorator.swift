//
//  CachedDecorator.swift
//  Architecture
//
//  Created by Rani Badri on 7/30/25.
//


struct CacheDecorator: ArticleRepositoryInterface {
    private let cache: CacheInterface
    private let repository: ArticleRepositoryInterface
    
    init(
        cache: CacheInterface,
        repository: ArticleRepositoryInterface
    ) {
        self.cache = cache
        self.repository = repository
    }
    
    func getArticles() async throws -> [Article] {
        if let cached = cache.getArticles() {
            return cached
        }
        
        let articles = try await repository.getArticles()
        self.cache.store(articles: articles)
        return articles
    }
}

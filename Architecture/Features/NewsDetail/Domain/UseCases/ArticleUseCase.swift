//
//  ArticleUseCase.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Business Logic
struct ArticleUseCase {
    private let repository: ArticleInterface
    
    init(repository: ArticleInterface) {
        self.repository = repository
    }
    
    func getArticles() async throws -> [Article] {
        return try await repository.getArticles()
    }
}

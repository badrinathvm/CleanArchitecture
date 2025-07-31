//
//  ArticleUseCase.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Business Logic
struct ArticleUseCase {
    private let datasource: ArticleRepositoryInterface
    
    init(datasource: ArticleRepositoryInterface) {
        self.datasource = datasource
    }
    
    func getArticles() async throws -> [Article] {
        return try await datasource.getArticles()
    }
}

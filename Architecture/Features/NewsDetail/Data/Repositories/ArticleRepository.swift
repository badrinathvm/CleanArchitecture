//
//  ArticleRepository.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Repository Implementation
struct ArticleRepository: ArticleInterface {
    let service: ArticleService
    
    init(service: ArticleService) {
        self.service = service
    }
    
    func getArticles() async throws -> [Article] {
        try await service.getArticles()
    }
}

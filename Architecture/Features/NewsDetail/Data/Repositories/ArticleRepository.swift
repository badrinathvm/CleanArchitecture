//
//  ArticleRepository.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Repository Implementation
struct ArticleRepository: ArticleRepostoryInterface {
    let service: ArticleService
    let mapper: ArticleResponseMapper
    
    init(
        service: ArticleService,
        mapper: ArticleResponseMapper
    ) {
        self.service = service
        self.mapper = mapper
    }
    
    func getArticles() async throws -> [Article] {
        guard let newsResponse = try await service.getArticles() else { return [] }
        return mapper.map(newsResponse)
    }
}

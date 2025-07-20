//
//  ArtifactService.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Access to API's
struct ArticleService {
    init() {}
    
    func getArticles() async throws -> [Article] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        // Make an actual network call amd decode.
        return [
            Article(id: UUID(), title: "Article 1", content: "Content"),
            Article(id: UUID(), title: "Article 2", content: "Content")
        ]
    }
}

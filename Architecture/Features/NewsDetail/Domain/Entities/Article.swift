//
//  Article.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Domain Model
//struct Article: Identifiable {
//    let id: UUID
//    let title: String
//    let content: String
//    
//    init(id: UUID, title: String, content: String) {
//        self.id = id
//        self.title = title
//        self.content = content
//    }
//}

// MARK: - Domain Entities
struct Article: Identifiable {
    let id: String
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: URL
    let imageURL: URL?
    let publishedAt: Date
    let content: String?
    let category: ArticleCategory
}

struct Source {
    let id: String?
    let name: String
}

enum ArticleCategory: String, CaseIterable {
    case technology = "technology"
    case business = "business"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case entertainment = "entertainment"
    case general = "general"
}

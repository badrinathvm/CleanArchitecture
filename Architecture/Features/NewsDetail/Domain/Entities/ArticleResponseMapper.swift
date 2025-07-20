//
//  ArticleResponseMapper.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation


// MARK: - Mapper (converts API → Domain)
struct ArticleResponseMapper {
    private static let dateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    
    static func map(_ response: NewsArticlesResponse) -> [Article] {
        return response.articles.compactMap { articleResponse in
            guard let url = URL(string: articleResponse.url),
                  let publishedDate = dateFormatter.date(from: articleResponse.publishedAt) else {
                return nil
            }
            
            return Article(
                id: UUID().uuidString,
                source: Source(
                    id: articleResponse.source.id,
                    name: articleResponse.source.name
                ),
                author: articleResponse.author,
                title: articleResponse.title,
                description: articleResponse.description,
                url: url,
                imageURL: articleResponse.urlToImage.flatMap(URL.init),
                publishedAt: publishedDate,
                content: articleResponse.content,
                category: inferCategory(from: articleResponse.title + " " + (articleResponse.description ?? ""))
            )
        }
    }
    
    private static func inferCategory(from text: String) -> ArticleCategory {
        let lowercased = text.lowercased()
        
        if lowercased.contains("tech") || lowercased.contains("ai") || lowercased.contains("software") {
            return .technology
        } else if lowercased.contains("business") || lowercased.contains("market") || lowercased.contains("economy") {
            return .business
        } else if lowercased.contains("health") || lowercased.contains("medical") {
            return .health
        } else if lowercased.contains("science") || lowercased.contains("research") {
            return .science
        } else if lowercased.contains("sport") || lowercased.contains("football") || lowercased.contains("basketball") {
            return .sports
        } else if lowercased.contains("movie") || lowercased.contains("celebrity") || lowercased.contains("entertainment") {
            return .entertainment
        } else {
            return .general
        }
    }
}

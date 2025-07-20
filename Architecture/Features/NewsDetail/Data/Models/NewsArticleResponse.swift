//
//  NewsArticleResponse.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//


// MARK: - API Response Models
struct NewsArticlesResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleResponse]
}

struct ArticleResponse: Codable {
    let source: SourceResponse
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct SourceResponse: Codable {
    let id: String?
    let name: String
}


// MARK: - Mock Data
extension NewsArticlesResponse {
    static var mockResponse: NewsArticlesResponse {
        return NewsArticlesResponse(
            status: "ok",
            totalResults: 5,
            articles: [
                ArticleResponse(
                    source: SourceResponse(id: "techcrunch", name: "TechCrunch"),
                    author: "Sarah Johnson",
                    title: "Apple Unveils Revolutionary AI-Powered MacBook Pro with M4 Chip",
                    description: "Apple's latest MacBook Pro features the groundbreaking M4 chip with enhanced AI capabilities, promising 40% better performance and 12-hour battery life.",
                    url: "https://techcrunch.com/2025/01/15/apple-macbook-pro-m4-ai",
                    urlToImage: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800",
                    publishedAt: "2025-01-15T14:30:00.000Z",
                    content: "Apple today announced its most powerful MacBook Pro yet, featuring the revolutionary M4 chip with dedicated AI processing units. The new laptop promises unprecedented performance for creative professionals..."
                ),
                ArticleResponse(
                    source: SourceResponse(id: "reuters", name: "Reuters"),
                    author: "Michael Chen",
                    title: "Global Markets Rally as Tech Stocks Surge to Record Highs",
                    description: "Technology stocks led a broad market rally today, with the NASDAQ reaching an all-time high amid strong earnings reports from major tech companies.",
                    url: "https://reuters.com/markets/tech-stocks-surge-2025-01-15",
                    urlToImage: "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=800",
                    publishedAt: "2025-01-15T16:45:00.000Z",
                    content: "Wall Street closed at record highs today as technology stocks surged following better-than-expected quarterly earnings from several major companies..."
                ),
                ArticleResponse(
                    source: SourceResponse(id: "bbc-news", name: "BBC News"),
                    author: "Dr. Emily Watson",
                    title: "Breakthrough Gene Therapy Shows Promise for Treating Alzheimer's Disease",
                    description: "Scientists report significant progress in a new gene therapy approach that could potentially slow or reverse Alzheimer's disease progression in early trials.",
                    url: "https://bbc.com/news/health-alzheimers-gene-therapy-2025",
                    urlToImage: "https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=800",
                    publishedAt: "2025-01-15T10:20:00.000Z",
                    content: "A groundbreaking gene therapy treatment has shown remarkable results in early clinical trials for Alzheimer's disease patients..."
                ),
                ArticleResponse(
                    source: SourceResponse(id: "espn", name: "ESPN"),
                    author: "James Rodriguez",
                    title: "NBA Finals: Lakers Defeat Celtics in Thrilling Game 7 Showdown",
                    description: "The Los Angeles Lakers captured their 18th NBA championship after a nail-biting 112-109 victory over the Boston Celtics in Game 7.",
                    url: "https://espn.com/nba/finals-game7-2025",
                    urlToImage: "https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800",
                    publishedAt: "2025-01-14T23:15:00.000Z",
                    content: "In one of the most thrilling NBA Finals in recent memory, the Los Angeles Lakers defeated the Boston Celtics 112-109 in Game 7..."
                ),
                ArticleResponse(
                    source: SourceResponse(id: "nature", name: "Nature"),
                    author: "Prof. David Kumar",
                    title: "Scientists Discover New Species of Deep-Sea Creature in Pacific Ocean",
                    description: "Marine biologists have identified a previously unknown species of bioluminescent jellyfish living at depths of over 4,000 meters in the Pacific Ocean.",
                    url: "https://nature.com/articles/pacific-jellyfish-discovery-2025",
                    urlToImage: "https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800",
                    publishedAt: "2025-01-14T12:00:00.000Z",
                    content: "A team of marine biologists from the University of California has discovered a new species of deep-sea jellyfish with unique bioluminescent properties..."
                )
            ]
        )
    }
}

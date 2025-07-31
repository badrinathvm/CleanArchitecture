//
//  ArticleRepository.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Repository Implementation

struct ArticleRepository: ArticleRepositoryInterface {
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


struct OfflineRepository: ArticleRepositoryInterface {
    func getArticles() async throws -> [Article] {
        let sampleArticles = [
            Article(
                id: "article-001",
                source: Source(id: "techcrunch", name: "TechCrunch"),
                author: "Sarah Johnson",
                title: "Apple Unveils Revolutionary AI Features in Latest iOS Update",
                description: "Apple's new AI capabilities promise to transform how users interact with their devices, offering enhanced productivity and personalization.",
                url: URL(string: "https://techcrunch.com/2025/apple-ai-features")!,
                imageURL: URL(string: "https://images.techcrunch.com/apple-ai-hero.jpg"),
                publishedAt: Date(timeIntervalSince1970: 1722337200), // July 30, 2025
                content: "Apple today announced a suite of groundbreaking AI features that will be integrated into the next iOS update...",
                category: .technology
            ),
            
            Article(
                id: "article-002",
                source: Source(id: "bbc-news", name: "BBC News"),
                author: "Michael Chen",
                title: "Global Climate Summit Reaches Historic Agreement on Carbon Reduction",
                description: "World leaders commit to ambitious new targets for reducing carbon emissions by 2030.",
                url: URL(string: "https://bbc.com/news/climate-summit-2025")!,
                imageURL: URL(string: "https://ichef.bbci.co.uk/news/climate-summit.jpg"),
                publishedAt: Date(timeIntervalSince1970: 1722250800), // July 29, 2025
                content: "In a landmark decision, representatives from 195 countries have agreed to unprecedented carbon reduction targets...",
                category: .technology
            ),
            
            Article(
                id: "article-003",
                source: Source(id: "espn", name: "ESPN"),
                author: nil,
                title: "Olympic Records Shattered in Swimming Championships",
                description: "Multiple world records broken as swimmers prepare for upcoming international competition.",
                url: URL(string: "https://espn.com/olympics/swimming-records-2025")!,
                imageURL: URL(string: "https://a.espncdn.com/swimming-records.jpg"),
                publishedAt: Date(timeIntervalSince1970: 1722164400), // July 28, 2025
                content: "The swimming world witnessed history in the making as three world records fell during yesterday's championship finals...",
                category: .sports
            ),
            
            Article(
                id: "article-004",
                source: Source(id: "reuters", name: "Reuters"),
                author: "David Martinez",
                title: "Stock Markets Rally as Tech Earnings Exceed Expectations",
                description: "Major technology companies report stronger than expected quarterly results, driving market optimism.",
                url: URL(string: "https://reuters.com/markets/tech-earnings-rally-2025")!,
                imageURL: nil,
                publishedAt: Date(timeIntervalSince1970: 1722078000), // July 27, 2025
                content: nil,
                category: .business
            ),
            
            Article(
                id: "article-005",
                source: Source(id: "variety", name: "Variety"),
                author: "Emma Thompson",
                title: "Streaming Wars Heat Up with New Platform Launches",
                description: "Three major entertainment companies announce competing streaming services set to launch this fall.",
                url: URL(string: "https://variety.com/streaming-wars-2025")!,
                imageURL: URL(string: "https://variety.com/wp-content/streaming-platforms.jpg"),
                publishedAt: Date(timeIntervalSince1970: 1721991600), // July 26, 2025
                content: "The battle for streaming supremacy intensifies as Disney, Warner Bros, and NBCUniversal prepare to launch...",
                category: .entertainment
            )
        ]
        return sampleArticles
    }
}

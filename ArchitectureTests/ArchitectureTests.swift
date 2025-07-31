//
//  ArchitectureTests.swift
//  ArchitectureTests
//
//  Created by Rani Badri on 7/19/25.
//

import Testing
@testable import Architecture
import XCTest

struct ArchitectureTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        XCTAssertTrue(1==1)
    }

}


struct ArticleDecoratorTests {
    
    @Test func test_decorator_returns_single_article() async throws {
        let articleDecorator = await ArticleDecorator(logger: MockLogger(), repository: MockArticleRepository())
        let articles = try await articleDecorator.getArticles()
        #expect(articles.count == 1)
        #expect(articles[0].id == "article-001")
        //assert(articles.count == 1)
    }
    
    @Test func test_decorator_returns_empty_article() async throws {
        let articleDecorator = await ArticleDecorator(logger: MockLogger(), repository: MockEmptyArticleReposiory())
        let articles = try await articleDecorator.getArticles()
        #expect(articles.isEmpty)
    }
    
    @Test func test_decorator_logs_info_messages_on_Empty_result() async throws {
        let logger = MockLogger()
        let articleDecorator = await ArticleDecorator(logger: logger, repository: MockArticleRepository())
        let _ = try await articleDecorator.getArticles()
        
        #expect(logger.infoMessages.count == 2)
    }
    
    /*
    @Test func test_decorator_handles_concurrent_requests() async throws {
           let articleDecorator = await ArticleDecorator(
               logger: MockLogger(),
               repository: MockArticleRepository()
           )
           
           // Execute multiple concurrent requests
           async let result1 = articleDecorator.getArticles()
           async let result2 = articleDecorator.getArticles()
           async let result3 = articleDecorator.getArticles()
           
           let articles1 = try await result1
           let articles2 = try await result2
           let articles3 = try await result3
           
           #expect(articles1.count == 1)
           #expect(articles2.count == 1)
           #expect(articles3.count == 1)
           
           // Verify data consistency across concurrent calls
           #expect(articles1[0].id == articles2[0].id)
           #expect(articles2[1].id == articles3[1].id)
       }
     */
}

final class MockArticleRepository: ArticleRepositoryInterface {
    func getArticles() async throws -> [Article] {
        return [
            Article(
                id: "article-001",
                source: Source(id: "techcrunch", name: "TechCrunch"),
                author: "Sarah Johnson",
                title: "Apple Unveils Revolutionary AI Features in Latest iOS Update",
                description: "Apple's new AI capabilities promise to transform how users interact with their devices, offering enhanced productivity and personalization.",
                url: URL(string: "https://techcrunch.com/2025/apple-ai-features")!,
                imageURL: URL(string: "https://images.techcrunch.com/apple-ai-hero.jpg"),
                publishedAt: Date(timeIntervalSince1970: 1722337200),
                content: "Apple today announced a suite of groundbreaking AI features that will be integrated into the next iOS update...",
                category: .technology
            )
        ]
    }
}

final class MockEmptyArticleReposiory: ArticleRepositoryInterface {
    func getArticles() async throws -> [Article] {
        return []
    }
}

final class MockLogger: LoggerInterface {
    private(set) var infoMessages: [String] = []
    private(set) var errorMessages: [String] = []
    
    func logInfo(_ message: String) {
        infoMessages.append(message)
    }
    
    func logError(_ message: String) {
        errorMessages.append(message)
    }
    
    func reset() {
        infoMessages.removeAll()
        errorMessages.removeAll()
    }
}




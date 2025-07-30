//
//  ArtifactService.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// API : https://gist.githubusercontent.com/badrinathvm/44d0d180d0131b831ae979f6daf09c49/raw/9944f625e1bc280069cf5bf043299b77cb616d0c/news_articles.json

// MARK: - Access to API's
struct ArticleService {
    init() {}
    
    func getArticles() async throws -> NewsArticlesResponse? {
        guard let url = URL(string: "https://gist.githubusercontent.com/badrinathvm/44d0d180d0131b831ae979f6daf09c49/raw/9944f625e1bc280069cf5bf043299b77cb616d0c/news_articles.json") else { return nil }
        let result = await fetchArticles(url: url)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}

extension ArticleService {
    func fetchArticles(url: URL) async -> Result<NewsArticlesResponse, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let newsArticleResponse = try decoder.decode(NewsArticlesResponse.self, from: data)
            return .success(newsArticleResponse)
        } catch let error {
            print(error.localizedDescription)
            return .failure(error)
        }
    }
}

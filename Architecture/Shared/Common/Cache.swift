//
//  Cache.swift
//  Architecture
//
//  Created by Rani Badri on 7/30/25.
//

import Foundation

protocol CacheInterface {
    func store(articles: [Article])
    func getArticles() -> [Article]?
}

// Wrapper class to make Article array compatible with NSCache
private class ArticleArrayWrapper: NSObject {
    let articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
}

struct Cache: CacheInterface {
    private let cache = NSCache<NSString, ArticleArrayWrapper>()
    private let cacheKey = "cached_articles"
    
    init() {
        // configure cache limits
        cache.countLimit = 10 // maxim,um 10 entries
        cache.totalCostLimit = 1024 * 1024 * 50  // 50 MB
    }
    
    func store(articles: [Article]) {
        let wrapper = ArticleArrayWrapper(articles: articles)
        cache.setObject(wrapper, forKey: NSString(string: cacheKey))
        
    }
    
    func getArticles() -> [Article]? {
        //guard let wrapper = cache.object(forKey: NSString(string: cacheKey)) else { return [] }
        let wrapper = cache.object(forKey: NSString(string: cacheKey))
        return wrapper?.articles
    }
}

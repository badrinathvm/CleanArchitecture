//
//  ArtifactInterface.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

/**
 Domain Layer (ArticlesInterface)
         ↑ depends on
 Data Layer (ArticleRepository implements ArticlesInterface)
 
 */


// MARK: - Domain  Interfaces ( Abstratc Contract) 
protocol ArticleRepostoryInterface {
    func getArticles() async throws-> [Article]
}

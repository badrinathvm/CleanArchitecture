//
//  Article.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Foundation

// MARK: - Domain Model
struct Article: Identifiable {
    let id: UUID
    let title: String
    let content: String
    
    init(id: UUID, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}

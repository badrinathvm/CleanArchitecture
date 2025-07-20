//
//  NewsDetail.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

// MARK: - Main Container for all the sections/Flows
struct NewsDetail<
    ArticleSection: View
>: View {
    
    @Bindable private var state: NewsState
    private let articleSection: ArticleSection
    
    init(
        state: NewsState,
        articleSection: ArticleSection
    ) {
        self.state = state
        self.articleSection = articleSection
    }
    
    var body: some View {
        VStack {
            self.articleSection
        }
    }
}

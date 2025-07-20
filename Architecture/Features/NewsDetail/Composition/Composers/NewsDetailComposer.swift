//
//  NewsDetailComposer.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

// MARK: - Main Composer
struct NewsDetailComposer {
    func compose(_ state: NewsState) -> some View {
        NewsDetail(
            state: state,
            articleSection: ArticleSectionFlowComposer.compose(state)
        )
    }
}

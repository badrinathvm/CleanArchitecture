//
//  ArticleCard.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

// MARK: - UI Component
struct ArticleCard: View {
    @Bindable private var state:NewsState
    let onLoad: () -> Void
    
    init(
        state: NewsState,
        onLoad: @escaping () -> Void
    ) {
        self._state = Bindable(state)
        self.onLoad = onLoad
    }
    
    var body: some View {
        VStack {
            ForEach(state.articles) { article in
                HStack {
                    Text(article.title)
                    
                    Text(article.content)
                }
            }
        }
        .onAppear {
            self.onLoad()
        }
    }
}

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
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(state.articles) { article in
                    Text(article.title)
                        .font(.title)
                    
                    if let content = article.content {
                        Text(content)
                            .font(.subheadline)
                    }
                }
            }
            .padding(.all)
        }
        .onAppear {
            self.onLoad()
        }
    }
}

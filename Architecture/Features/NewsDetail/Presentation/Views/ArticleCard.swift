//
//  ArticleCard.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

// MARK: - UI Component
struct ArticleCard: View {
    @State private var isInitialLoadComplete = false
    @Bindable private var state: NewsState
    let onLoad: () -> Void
    let onLoadMore: () -> Void
    
    init(
        state: NewsState,
        onLoad: @escaping () -> Void,
        onLoadMore: @escaping () -> Void
    ) {
        self._state = Bindable(state)
        self.onLoad = onLoad
        self.onLoadMore = onLoadMore
    }
    
    var body: some View {
        List {
            LazyVStack(alignment: .leading) {
                ForEach(state.articles) { article in
                    Text(article.title)
                        .font(.headline)
                    
                    if let content = article.content {
                        Text(content)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.all)
            }
            
            if state.isLoading {
                ProgressView("Loading Articles...")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                Color.clear
                    .onAppear {
                        // check if articles exists before loading
                        if isInitialLoadComplete {
                            print("Place for Pagination - Loading more articles")
                            // Call your pagination logic here
                            self.onLoadMore()
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .onAppear {
            self.onLoad()
        }
        .onChange(of: state.articles.isEmpty) { oldValue , newValue in
            // oldValue = true, newValue = false
            if !newValue && !isInitialLoadComplete {
                isInitialLoadComplete = true
            }
        }
        .scrollIndicators(.hidden)
    }
}

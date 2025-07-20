//
//  NewsDetailFlow.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import SwiftUI

// MARK: - State Manager
struct NewsDetailFlow<Detail:View>: View {
    @State private var state: NewsState
    let detail: (NewsState) -> Detail
    
    init(detail: @escaping (NewsState) -> Detail) {
        self._state = State(wrappedValue: NewsState())
        self.detail = detail
    }
    
    var body: some View {
        self.detail(self.state)
    }
}

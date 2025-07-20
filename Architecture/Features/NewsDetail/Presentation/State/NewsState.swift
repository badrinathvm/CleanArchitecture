//
//  NewsState.swift
//  Architecture
//
//  Created by Rani Badri on 7/19/25.
//

import Observation
import Foundation

@Observable
class NewsState {
    var articles: [Article] = []
    var isLoading = false
}

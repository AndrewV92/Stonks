//
//  SearchResponse.swift
//  Stonks
//
//  Created by Андрей Воробьев on 30.12.2021.
//

import Foundation

/// API rescopnse for search
struct SearchResponse: Codable {
    let count: Int
    let result: [SearchResult]
}

/// A single search result 
struct SearchResult: Codable {
    let description: String
    let displaySymbol: String
    let symbol: String
    let type: String
}

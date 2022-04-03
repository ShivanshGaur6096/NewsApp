//
//  NewsFeed.swift
//  Working with API
//
//  Created by Shivansh Gaur on 17/09/21.
//

import Foundation

// MARK: - News Feeds
struct NewsFeed: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Articles]?
}

// MARK: - Articles
struct Articles: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

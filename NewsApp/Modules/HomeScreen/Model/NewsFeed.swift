//
//  NewsFeed.swift
//  Working with API
//
//  Created by Shivansh Gaur on 17/09/21.
//
import Foundation

struct NewsFeed {
    var status: String?
    var totalResults: Int?
    var articles:[Articles]?
    
    init(dict: [String: Any]) {
        self.status = dict["status"] as? String
        self.totalResults = dict["totalResults"] as? Int
        if let articlesArray = dict["articles"] as? [[String: Any]] {
            self.articles = articlesArray.map {Articles($0) }
        }
    }
}

struct Articles {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    var source:Source?
    
    init(_ dict: [String: Any]) {
        self.author = dict["author"] as? String
        self.title = dict["title"] as? String
        self.description = dict["description"] as? String
        self.url = dict["url"] as? String
        self.urlToImage = dict["urlToImage"] as? String
        self.publishedAt = dict["publishedAt"] as? String
        self.content = dict["content"] as? String
        if let sourceData = dict["source"] as? [String: Any] {
            self.source = Source(sourceData)
        }
    }
}

struct Source {
    
    var id:String?
    var name:String?

    init(_ dict: [String: Any]) {
        self.id = dict["id"] as? String
        self.name = dict["name"] as? String
    }
}



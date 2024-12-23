//
//  ArticleModel.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation


struct ArticleModel: Decodable {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageContainer?
    var requestId: String?
    
    var sourceName: String?
    var timeOfReading: String?
    var isHotNews: Bool?
    
    var articleUrl: URL? {
        let requestId = requestId ?? ""
        let newsId = newsId ?? 0
        return URL(string: "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)")
    }
    
}

struct ImageContainer: Decodable {
    var url: URL?
}

struct NewsPage: Decodable {
    var news: [ArticleModel]?
    var requestId: String?
    
    mutating func passTheRequestId() {
        for i in 0..<(news?.count ?? 0) {
        news?[i].requestId = requestId
        }
    }
}

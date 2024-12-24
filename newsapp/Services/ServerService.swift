//
//  ServerService.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation
import UIKit
import Darwin

protocol ServerServiceProtocol: AnyObject {
    func fetchNews() -> [ArticleModel]
}

class ServerService: ServerServiceProtocol {
    private let decoder: JSONDecoder = JSONDecoder()
    private var newsPageParsed: NewsPage = NewsPage()
    
    private func getURL(_ rubric: Int, _ pageIndex: Int) -> URL? {
        URL(string: "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)")
    }
    
    // MARK: - ServerServiceProtocol methods
    
    // MARK: - Fetch news
    internal func fetchNews() -> [ArticleModel]{
        //TODO: Add error catching
        guard let url = getURL(4, 1) else { return [] }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if
                let self,
                let data = data,
                let newsPage = try? decoder.decode(NewsPage.self, from: data)
            {
                self.newsPageParsed = newsPage
                newsPageParsed.passTheRequestId()
                //print(newsPageParsed)
                
            }
        }.resume()
        
        //bad. fix
        sleep(1)
        return newsPageParsed.news ?? []
    }
}

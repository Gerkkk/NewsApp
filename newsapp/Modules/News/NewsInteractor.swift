//
//  NewsInteractor.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//


class NewsInteractor: NewsInteractorProtocol, NewsDataStore {
    weak var presenter: NewsPresenterProtocol!
    let serverService: ServerServiceProtocol = ServerService()
    
    var loadedNews: [ArticleModel]! = []
    
    
    
    required init(presenter: NewsPresenterProtocol) {
        self.presenter = presenter
        
        let ret: [ArticleModel] = serverService.fetchNews()
        print(ret)
    }
    
    func loadFreshNews() {
        loadedNews = serverService.fetchNews()
    }
    
    func loadMoreNews() {
        let moreNews: [ArticleModel] = serverService.fetchNews()
        
        for i in moreNews {
            let isNew = loadedNews.contains { element in
                if element.newsId == i.newsId {
                    return false
                } else {
                    return true
                }
            }
            
            if isNew {
                loadedNews.append(i)
            }
        }
    }
}

//
//  NewsInteractor.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

class NewsInteractor: NewsInteractorProtocol {
    
    weak var presenter: NewsPresenterProtocol!
    let serverService: ServerServiceProtocol = ServerService()
    
    required init(presenter: NewsPresenterProtocol) {
        self.presenter = presenter
    }
}

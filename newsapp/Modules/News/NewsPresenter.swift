//
//  NewsPresenter.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation
import UIKit

class NewsPresenter: NewsPresenterProtocol {
    weak var view: NewsViewProtocol!
    var interactor: NewsInteractorProtocol!
    var router: NewsRouterProtocol!
    
    required init(view: NewsViewProtocol) {
        self.view = view
    }
    
    // MARK: - NewsPresenterProtocol methods
    func closeButtonClicked() {
        router.closeCurrentViewController()
    }
    
    func presentNews() {
        self.view.newsTable.reloadData()
    }
    
    func configureView() {
        
    }
    
}

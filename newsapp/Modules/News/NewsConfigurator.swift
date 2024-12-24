//
//  NewsConfigurator.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation
import UIKit

class NewsConfigurator: NewsConfiguratorProtocol {
    
    func configure(with viewController: NewsViewController) {
        let presenter = NewsPresenter(view: viewController)
        let interactor = NewsInteractor(presenter: presenter)
        let router = NewsRouter(viewController: viewController)
        
        viewController.interactor = interactor
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

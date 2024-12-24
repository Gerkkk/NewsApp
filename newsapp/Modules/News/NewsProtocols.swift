//
//  NewsProtocols.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation
import UIKit


protocol NewsViewProtocol: AnyObject {
    var newsTable: UITableView { get }
}

protocol NewsPresenterProtocol: AnyObject {
    var router: NewsRouterProtocol! { set get }
    func presentNews()
    func configureView()
}

protocol NewsDataStore: AnyObject {
    var loadedNews: [ArticleModel]! { get }
}

protocol NewsInteractorProtocol: AnyObject {
}

protocol NewsRouterProtocol: AnyObject {
    func closeCurrentViewController()
}

protocol NewsConfiguratorProtocol: AnyObject {
    func configure(with viewController: NewsViewController)
}

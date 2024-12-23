//
//  NewsProtocols.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation


protocol NewsViewProtocol: AnyObject {
}

protocol NewsPresenterProtocol: AnyObject {
    var router: NewsRouterProtocol! { set get }
    func configureView()
    func closeButtonClicked()
}

protocol NewsInteractorProtocol: AnyObject {
}

protocol NewsRouterProtocol: AnyObject {
    func closeCurrentViewController()
}

protocol NewsConfiguratorProtocol: AnyObject {
    func configure(with viewController: NewsViewController)
}

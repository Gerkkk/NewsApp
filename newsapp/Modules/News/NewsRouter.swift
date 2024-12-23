//
//  NewsRouter.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import Foundation
import UIKit

class NewsRouter: NewsRouterProtocol {
    
    weak var viewController: NewsViewController!
    
    init(viewController: NewsViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}

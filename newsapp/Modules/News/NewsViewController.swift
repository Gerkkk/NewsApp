//
//  ViewController.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import UIKit

class NewsViewController: UIViewController, NewsViewProtocol {
    var presenter: NewsPresenter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
}


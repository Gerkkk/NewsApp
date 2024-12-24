//
//  ViewController.swift
//  newsapp
//
//  Created by Danya Polyakov on 23.12.2024.
//

import UIKit

private enum Constants {
    static let colorBackGround = UIColor(red: 62/255, green: 95/255, blue: 138/255, alpha: 1.0)
    static let colorTable = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    static let cornerRadius = CGFloat(15)
    static let topTable = CGFloat(20)
    static let tableRowHeight = CGFloat(300)
}

class NewsViewController: UIViewController, NewsViewProtocol {
    let newsTable: UITableView = UITableView()
    weak var interactor: (NewsInteractor & NewsDataStore)?
    
    var presenter: NewsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.colorBackGround
        presenter.configureView()
        
        
        view.addSubview(newsTable)
        newsTable.backgroundColor = Constants.colorTable
        newsTable.dataSource = self
        newsTable.delegate = self 
        newsTable.separatorStyle = .none
        newsTable.layer.cornerRadius = Constants.cornerRadius
        newsTable.rowHeight = Constants.tableRowHeight
        
        newsTable.pin(to: view, Constants.topTable)
        newsTable.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)
        
        presenter.presentNews()
        //print(interactor?.loadedNews.count)
    }
}


//
//  WishStoringDataSource.swift
//  newsapp
//
//  Created by Danya Polyakov on 24.12.2024.
//

import Foundation
import UIKit

private enum Constants {
    static let numberOfSections = Int(5)
    static let swipeColor: UIColor = UIColor(red: 40/255, green: 67/255, blue: 103/255, alpha: 0.2)
}

// MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 0
        } else {
            interactor?.loadFreshNews()
            return interactor?.loadedNews.count ?? 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsCell.reuseId,
            for: indexPath
        )
        guard let newsCell = cell as? NewsCell else { return cell }
        
        newsCell.configure(with: (interactor!.loadedNews)[indexPath.row])
        return newsCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (interactor?.loadedNews.count ?? 0) > Constants.numberOfSections {
            return (interactor?.loadedNews.count ?? 0)
        } else {
            return Constants.numberOfSections
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    private func handleMarkAsFavourite() {
        print("Marked as favourite")
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Share via VK") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsFavourite()
                                            completionHandler(true)
        }
        action.backgroundColor = Constants.swipeColor
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

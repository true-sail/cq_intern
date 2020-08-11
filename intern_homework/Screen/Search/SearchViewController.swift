//
//  SearchViewController.swift
//  intern_homework
//
//  Created by 家田真帆 on 2020/08/10.
//  Copyright © 2020 caraquri. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchArticles()
    }
    
    private func searchArticles() {
        // 検索欄がnilの場合処理を中止
        guard let text = textField.text, !text.isEmpty else { return }
        
        // API
        APIClient.fetchArticles(keyword: text) { [weak self] result in
            DispatchQueue.main.sync {
                switch result {
                case .success(let articles):
                    self?.showArticleListScreen(articles)
                case .failure(let error):
                    let alert = UIAlertController.createErrorAlert(error)
                    self?.present(alert,animated: true)
                }
                self?.searchButton.isEnabled = true
            }
        }
    }
    
    // 記事を表示する機能
    private func showArticleListScreen(_ articles: [Article]) {
        let articleListViewController = ArticleListViewController.makeInstance(articles)
        navigationController?.pushViewController(articleListViewController, animated:  true)
    }
}

//
//  ArticleListViewController.swift
//  intern_homework
//
//  Created by 家田真帆 on 2020/08/11.
//  Copyright © 2020 caraquri. All rights reserved.
//

import SafariServices
import UIKit

// 記事一覧画面

final class ArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var articles: [Article] = []
    
    static func makeInstance(_ article: [Article]) -> ArticleListViewController {
        
        let articleListViewController = R.storyboard.articleList.instantiateInitialViewController()!
        articleListViewController.article = article
        return articleListViewController
    }

    
    override func viewDidLoad() {
        
        tableView.register(R.nib.sampleArticleListCell)
        tableView.reloadData()
        
//        tableView.delegate = self
//        tableView.dataSource = self
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sampleArticleListCell, for: indexPath),
            let article = articles[safe: indexPath.row] else { return UITableViewCell() }
        
        cell.set(article)
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    guard let urlString = articles[safe: indexPath.row]?.url,
        let url = URL(string: urlString) else { return }

    let safariViewController = SFSafariViewController(url: url)
    present(safariViewController, animated: true)
    }
}

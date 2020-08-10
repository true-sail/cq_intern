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
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchArticles()
    }
    
    private func searchArticles() {
        // 検索欄がnilの場合処理を中止
        guard let text = textField.text, !text.isEmpty else { return }
        
    }
    
}

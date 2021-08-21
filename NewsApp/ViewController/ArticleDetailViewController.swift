//
//  ArticleDetailViewController.swift
//  NewsApp
//
//  Created by lapshop on 8/21/21.
//

import Foundation
import UIKit

class ArticleDetailViewController : UIViewController {
    @IBOutlet weak var ArticleImageView: UIImageView!
    
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var articleContentLabel: UITextView!
    var article : Article!
    
    override func viewDidLoad() {
        setupUI()
    }
    
    private func setupUI() {
        if let imageUrl = article.image {
            UtitlyManager.sharedManager.downloadImage(with: imageUrl) { (data, error) in
                DispatchQueue.main.async {
                    if let data = data , error == nil {
                        self.ArticleImageView.image = UIImage(data: data)
                    }
                }
            }
        }else {
            self.ArticleImageView.image = UIImage(named: "No-Image-Placeholder")
        }
        
        sourceLabel.text = " Source :  \(article.source ?? "source name not available")"
        dateLabel.text = "Date:  \(UtitlyManager.sharedManager.dateFormmmater.string(from: article.publishedAt ?? Date()))"
        authorLabel.text = "Author Name:  \(article.author ??  "name not available")"
        articleContentLabel.text = article.description
    }
}

//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by lapshop on 8/20/21.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articelDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 5
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        self.containerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.containerView.layer.shadowOpacity = 1
        self.containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.containerView.layer.shadowRadius = 3
    }

    func configureCell(article : Article) {
        
        if let imageUrl  = article.image {
            UtitlyManager.sharedManager.downloadImage(with: imageUrl) { (data, error) in
                if  let data = data , error == nil  {
                    DispatchQueue.main.async {
                        self.articleImage.image = UIImage(data: data)
                    }
                }
                
            }
        }else {
            self.articleImage.image = UIImage(named: "No-Image-Placeholder")
        }
        
        articleTitleLabel.text = article.title
        articelDateLabel.text = " Date: \(UtitlyManager.sharedManager.dateFormmmater.string(from:article.publishedAt ?? Date()))"
    }
    
    
    override func prepareForReuse() {
        DispatchQueue.main.async {
            self.articleImage.image = UIImage(named: "No-Image-Placeholder")
        }
    }
    
}

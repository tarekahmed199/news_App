//
//  CategoryCollectionViewCell.swift
//  NewsApp
//
//  Created by lapshop on 8/20/21.
//

import UIKit





class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(title:String , cellID : Int) {
        let CellID = UserDefaults.standard.integer(forKey: "CELLID") 
        
        if cellID ==  CellID {
            self.categoryLabel.textColor = .black
        }else {
            self.categoryLabel.textColor = .lightGray
        }
        
        self.categoryLabel.text = title
       
    }
    
    }
    


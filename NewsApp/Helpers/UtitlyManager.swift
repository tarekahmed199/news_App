//
//  UtitlyManager.swift
//  NewsApp
//
//  Created by lapshop on 8/20/21.
//

import Foundation

class UtitlyManager {
    
    static var sharedManager = UtitlyManager()
    private init() {}
    
    var dateFormmmater : DateFormatter = {
        let dateFormmater = DateFormatter()
        dateFormmater.dateStyle = .long
        dateFormmater.timeStyle = .short
        return dateFormmater
    }()
    
    
    
    func downloadImage(with imageUrl:String,completion : @escaping (Data?,Error?) -> Void) {
        
        NewsApiManager.sharedManager.getFeedImage(with: imageUrl) { (data, error) in
            guard let data = data , error == nil else {
                completion(nil,error)
                return
            }
            completion(data,nil)
        }
    }
    
    
    
    
    
    
}

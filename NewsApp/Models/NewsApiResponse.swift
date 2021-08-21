//
//  NewsApiResponse.swift
//  NewsApp
//
//  Created by lapshop on 8/19/21.
//

import Foundation


struct NewsApiResponse : Codable {
    var articles : [Article]
    
    enum CodingKeys : String , CodingKey {
        case articles = "data"
    }
    
}

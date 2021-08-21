//
//  Globals.swift
//  NewsApp
//
//  Created by lapshop on 8/19/21.
//

import Foundation


enum  ApIConfiguration : String{
    case apiKey = "9765dbdc2f88ef9529ecaaed19b926fc"
    case country = "us"
    
}
enum CategoryTypes : String , CaseIterable {
    case  general
    case  business
    case  entertainment
    case  health
    case  science
    case  sports
    case  technology
}


/*
"http://api.mediastack.com/v1/news?access_key=9765dbdc2f88ef9529ecaaed19b926fc&countries=us"
*/
enum newsApiURL   {
    static let baseUrl = "http://api.mediastack.com/v1/news"
    static let apiKeyParameter = "?access_key="
    static let searchWordParameter = "&keywords="
    static let categoryParameter = "&categories="
    static let countryParameter = "&countries="
    
    case getNewsFeed(category : CategoryTypes)
   
    var url : URL? {
        guard let url = URL(string: self.stringUrl) else {
            return nil
        }
        return url
    }
    
    
    var stringUrl : String {
        switch self {
        case .getNewsFeed(let category):
            return newsApiURL.baseUrl + newsApiURL.apiKeyParameter + ApIConfiguration.apiKey.rawValue + newsApiURL.categoryParameter + category.rawValue + newsApiURL.countryParameter + ApIConfiguration.country.rawValue
        }
    }
    
}

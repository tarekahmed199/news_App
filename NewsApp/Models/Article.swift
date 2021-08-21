//
//  Feed.swift
//  NewsApp
//
//  Created by lapshop on 8/19/21.
//

import Foundation


/*
 {
 author: "Entertainment Weekly",
 title: "The Week in 'Wives: A RHOA reunion, RHOD finale, and RHONJ romance",
 description: "The best, worst, and wildest moments from this week on The Real Housewives.",
 url: "https://ca.sports.yahoo.com/news/week-wives-rhoa-reunion-rhod-003646034.html?src=rss",
 source: "sports",
 image: null,
 category: "general",
 language: "en",
 country: "us",
 published_at: "2021-05-01T00:36:46+00:00"
}
*/




struct Article : Codable {
    
    var author : String?
    var title : String?
    var description : String?
    var image: String?
    var publishedAt: Date?
    var source : String?
    
    enum Codingkeys : String, CodingKey {
        case author
        case title
        case description
        case image 
        case publishedAt = "published_at"
        case source
    }
    
    
}

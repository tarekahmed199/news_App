//
//  Feed.swift
//  NewsApp
//
//  Created by lapshop on 8/19/21.
//

import Foundation


/*
source: {
id: "the-verge",
name: "The Verge"
},
author: "Ashley Carman",
title: "Apple’s attempt at podcast subscriptions is off to a messy start",
description: "Apple launched its subscription podcast product in June, a month after it initially intended. Podcasters say the backend is causing episode delays and is built in a surprisingly un-Apple way.",
url: "https://www.theverge.com/2021/8/18/22630517/apple-podcasts-subscriptions-launch-dashboard",
urlToImage: "https://cdn.vox-cdn.com/thumbor/9YybuMcSDe2EDRzWdtQM7Mz-YNQ=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/22790046/acastro_210817_4721_0001.jpg",
publishedAt: "2021-08-18T15:56:40Z",
content: "Bugs and design flaws In April, Apple Podcasts was poised to revolutionize the industry. It announced in-app subscriptions, as well as an entirely new backend, representing one of the most monumental… [+8923 chars]"
*/




struct article : Codable {
    
    var source : Source?
    var author : String?
    var title : String?
    var description : String?
    var urlToImage: String?
    var publishedAt: String?
    var content : String?
    
    
    enum Codingkeys : String, CodingKey {
        case source
        case author
        case title
        case description
        case urlToImage
        case publishedAt
        case content
    }
    
    
}

struct Source : Codable {
    var id : String?
    var name : String?
    
    enum Codingkeys : String, CodingKey {
        case id
        case name
    }
    
}

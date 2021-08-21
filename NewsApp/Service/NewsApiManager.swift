//
//  NewApi.swift
//  NewsApp
//
//  Created by lapshop on 8/19/21.
//

import Foundation


class NewsApiManager {
    
    static var sharedManager = NewsApiManager()
    
    private init() {}
    
    
    func getNewsFeed(category : CategoryTypes ,completion: @escaping ([Article]?,Error?) -> Void) {
        
        guard  let url : URL = newsApiURL.getNewsFeed(category: category).url else {
            return
        }
        
       
       URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        guard let data = data else {
            completion(nil,error)
            return
        }
        
        let dd = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
        print(dd)
        
         
        do {
            let jsonDecoder = JSONDecoder()
            
            let newResponse = try jsonDecoder.decode(NewsApiResponse.self, from: data)
            completion(newResponse.articles,nil)
        }
        catch {
            completion(nil,error)
        }
        
       }.resume()
    }
    
    
    func getFeedImage(with ImagePath : String , completion: @escaping (Data?,Error?) ->Void ) {
        
        guard let url = URL(string: ImagePath)  else {
            return
        }
        
        URLSession.shared.dataTask(with: url ) { (data, resposne, error) in
            
            guard let data = data else {
                completion(nil,error)
                return
            }
            completion(data,nil)
        }.resume()
        
    }
    
}



    


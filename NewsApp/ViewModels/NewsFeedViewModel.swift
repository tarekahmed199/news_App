//
//  NewsFeedViewModel.swift
//  NewsApp
//
//  Created by lapshop on 8/20/21.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class NewsFeedViewModel {
    
    private var viewState = BehaviorRelay<state>(value: .loadingArticles)
    
    
    var articles : [Article] = []
    
    var stateObservable : Observable<state>   {
        return viewState.asObservable()
    }
    var newsCategories : [Category] {
        var cellID = 0
        return CategoryTypes.allCases.map { categoryTitle -> Category in
            cellID += 1
            return Category(title: categoryTitle.rawValue, cellID: cellID)
        }
    }
    
    enum state {
        case loadingArticles
    }
    
    enum action {
        case articleClicked(viewController:UIViewController,article:Article)
        case categoryClicked(category:CategoryTypes)
    }
    
    
    init() {
        loadNewFeed(category: .general)
    }
    
    
    func onAction(action:action)   {
        switch action {
        case .articleClicked(let viewController,let article):
            navigateToArticleDetailsViewController(viewController:viewController,article:article)
            break
        case .categoryClicked(let category):
            loadNewFeed(category: category)
        }
    }
    
    
    private func loadNewFeed(category:CategoryTypes) {
        NewsApiManager.sharedManager.getNewsFeed(category: category) { (articles, error) in
            
            guard let articles = articles ,error == nil  else {
                print(error)
                return
            }
            
            self.articles = articles
            self.viewState.accept(.loadingArticles)
        }
    }
    
    
    private func navigateToArticleDetailsViewController(viewController:UIViewController,article:Article) {
        if let articleDetailsViewController = viewController.storyboard?.instantiateViewController(identifier: "ArticleDetailViewController") as? ArticleDetailViewController {
            articleDetailsViewController.article = article
            viewController.navigationController?.pushViewController(articleDetailsViewController, animated: true)
        }
    }
}



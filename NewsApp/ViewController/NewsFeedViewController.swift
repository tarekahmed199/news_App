//
//  ViewController.swift
//  NewsApp
//
//  Created by lapshop on 8/19/21.
//

import UIKit
import RxSwift
import RxCocoa

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel : NewsFeedViewModel!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        setupTableView()
        setupCollectionView()
        registerCells()
    }
    

    private func setupObservers() {
        viewModel.stateObservable
            .subscribe(onNext: {
                switch $0 {
                case .loadingArticles:
                    DispatchQueue.main.async {
                        self.activityIndicatorView.stopAnimating()
                        self.tableView.reloadData()
                        self.collectionView.reloadData()
                    }
                    
                }
            }).disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func registerCells() {
       self.tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
       
       self.collectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    
}

extension NewsFeedViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as? ArticleTableViewCell {
            
            let article = viewModel.articles[indexPath.row]
            cell.configureCell(article: article)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles[indexPath.row]
        viewModel.onAction(action: .articleClicked(viewController: self, article: article))
    }
    
    
    
}

extension NewsFeedViewController : UICollectionViewDataSource  , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.newsCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell {
            
            let category = viewModel.newsCategories[indexPath.row]
            cell.configureCell(title: category.title, cellID: category.cellID)
            return cell
        }
        
      return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = viewModel.newsCategories[indexPath.row]
        UserDefaults.standard.setValue(category.cellID, forKey: "CELLID")
        self.activityIndicatorView.startAnimating()
        viewModel.onAction(action: .categoryClicked(category: CategoryTypes(rawValue: category.title)!))
    }
    
    
    
}


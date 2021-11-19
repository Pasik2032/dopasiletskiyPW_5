//
//  ArticleInteractor.swift
//  dopasiletskiyPW5
//
//  Created by Даниил Пасилецкий on 11.11.2021.
//

import UIKit

class ArticleIteractor {
    var page = 1
    var presenter: ArticlePresentationLogic?
    var articlesArray = [ArticleModel](){
        didSet{
            DispatchQueue.main.async{
                print ("count = " + String(self.articlesArray.count))
                self.presenter?.presentData(self.articlesArray)
            }
        }
    }
    let networkWorker: NetworkWorker = NetworkWorker()
    
   
}

//MARK: - Business logic

protocol ArticleBusinessLogic{
    func fetchArticle()
    func loadFreshNews()
    func loadMoreNews()
}

extension ArticleIteractor: ArticleBusinessLogic {
    
    func loadFreshNews() {
        NetworkWorker.sharedInstance.fetchNews(page: 1){result in
            switch result{
            case .failure(let error):
                print(error)
            case .success (let newsRes):
                self.articlesArray = newsRes
            }
        }
       
    }
    
    func loadMoreNews() {
        page += 1
        print(page)
        NetworkWorker.sharedInstance.fetchNews(page: page){result in
            switch result{
            case .failure(let error):
                print(error)
            case .success (let newsRes):
                self.articlesArray = newsRes
            }
        }
    }
    
    func fetchArticle() {
        presenter?.presentData(articlesArray)
    }
}

//MARK: - Data Store
protocol ArticleDataStore{
    var articles: [ArticleModel] {get set}
}

extension ArticleIteractor: ArticleDataStore {
    var articles: [ArticleModel] {
        get {
            return articlesArray
        }
        set {
            articlesArray = newValue
        }
    }
}



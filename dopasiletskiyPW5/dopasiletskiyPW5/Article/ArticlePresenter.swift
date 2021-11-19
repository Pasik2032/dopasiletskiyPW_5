//
//  ArticlePresenter.swift
//  dopasiletskiyPW5
//
//  Created by Даниил Пасилецкий on 11.11.2021.
//

import UIKit

protocol ArticlePresentationLogic{
    func presentData(_ articles: [ArticleModel])
}


class ArticlePresentater {
    weak var viewController: ArticleDisplayLogic?
    var news: [NewsModel] = []
}


// MARK: - Presentation logic
extension  ArticlePresentater: ArticlePresentationLogic {
    func presentData(_ articles: [ArticleModel]) {
        news.removeAll()
        for  item in articles {
            var newNews = NewsModel()
            newNews.title = item.title
            newNews.announce = item.announce
            newNews.articleUrl = item.articleUrl
            newNews.img = item.loadImage()!
            news.append(newNews)
        }
        print(articles.count)
        viewController?.dispayData(news)
    }
}

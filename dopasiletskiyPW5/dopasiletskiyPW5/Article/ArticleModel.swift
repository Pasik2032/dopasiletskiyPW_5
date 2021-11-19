//
//  ArticleModel.swift
//  dopasiletskiyPW5
//
//  Created by Даниил Пасилецкий on 12.11.2021.
//

import Foundation
import UIKit

// MARK: - Article model backend
struct ArticleModel: Decodable {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageContainer?
    var requestId: String?
    var articleUrl: URL? {
        let requestId = requestId ?? ""
        let newsId = newsId ?? 0
        return URL(string: "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)")
    }
    
    func loadImage() -> UIImage? {
        guard let data = try? Data(contentsOf: (img?.url)!) else {
            return nil
        }
        return UIImage(data: data)
    }
}

// MARK: - Article model frontend (NewsModel)
struct NewsModel {
    var title: String?
    var announce: String?
    var img: UIImage? = UIImage(named: "load")
    var articleUrl: URL?
}

// MARK: - Article page
struct ArticlePage: Decodable {
    var news: [ArticleModel]?
    var requestId: String?
    mutating func passTheRequestId() {
        for i in 0..<(news?.count ?? 0) {
            news?[i].requestId = requestId
         }
    }
}

// MARK: - Image
struct ImageContainer: Decodable {
    var url: URL?
}



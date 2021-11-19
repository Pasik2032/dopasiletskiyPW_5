//
//  ArticleWorker .swift
//  dopasiletskiyPW5
//
//  Created by Даниил Пасилецкий on 12.11.2021.
//

import Foundation

class NetworkWorker{
    static let sharedInstance = NetworkWorker()
    let session = URLSession.shared
    
    //MARK: GetURL
    private func getURL(_ rubric: Int, _ pageIndex: Int) -> URL? {
        URL(string: "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)"
        )
    }
    
    // MARK: - Fetch news
    var articleArray: [ArticleModel]?
    func fetchNews(page: Int, completion: @escaping(Result<[ArticleModel], UserError>) -> Void ) {
        guard let url = getURL(4, page) else {
            completion(.failure(.invalidURL))
            return
            
        }
        let task = session.dataTask(with: url) { [weak self] data,
            response, error in
            if let error = error {
                completion(.failure(.NoData))
                return
            }
            guard let data = data else {return}
            guard var page = try? JSONDecoder().decode(ArticlePage.self, from: data) else {
                completion(.failure(.CanNotProcess))
                return
            }
            page.passTheRequestId()
            completion(.success(page.news ?? []))
            self?.articleArray = page.news
            print (self?.articleArray?.count)
        }
        
        task.resume()
        
    }
    
}

//MARK: - Error
enum UserError: Error{
    case NoData
    case CanNotProcess
    case invalidURL
}

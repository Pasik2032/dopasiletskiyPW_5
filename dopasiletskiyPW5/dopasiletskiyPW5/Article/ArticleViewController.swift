//
//  ViewController.swift
//  dopasiletskiyPW5
//
//  Created by Даниил Пасилецкий on 11.11.2021.
//

import UIKit
// MARK: Protocol
protocol ArticleDisplayLogic: class {
    func dispayData(_ articles: [NewsModel])
    func updateData()
}

//MARK: - init
class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var interactor: (ArticleBusinessLogic & ArticleDataStore)?
    private var dataToDisplay = [NewsModel]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    // MARK: - Setup
    private func setup(){
        self.title = "News"
        let viewController = self
        let presenter = ArticlePresentater()
        let interactor = ArticleIteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        interactor?.loadFreshNews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Table view setup
    let tableView: UITableView = UITableView()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataToDisplay.count)
        return dataToDisplay.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = WebController()
        guard let url = dataToDisplay[indexPath.row].articleUrl else { return }
        webVC.loadURL(url: url)
        present(webVC, animated: true,
                completion: nil)
    }
    
    
    let cellId = "ArticleCell"
    var last = 3
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ArticleCell
        cell?.titleLabel.text = self.dataToDisplay[indexPath.row].title
        cell?.descriptionLabel.text = self.dataToDisplay[indexPath.row].announce
        cell?.image.image = self.dataToDisplay[indexPath.row].img
        cell?.setupArticle()
        print ("setup \(indexPath.row)")
        if(indexPath.row == self.last ){
            self.last += 8
            print("new page")
            DispatchQueue.global().async {
                self.interactor?.loadMoreNews()
            }
        }
        return cell ?? UITableViewCell()
    }
    
    
    func setupTableView(){
        tableView.frame = self.view.frame
        tableView.showsVerticalScrollIndicator = true
        tableView.translatesAutoresizingMaskIntoConstraints = false //
        tableView.layer.masksToBounds = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 150
        tableView.register(ArticleCell.self.self, forCellReuseIdentifier: cellId)
        self.view.addSubview(tableView)
        print("play")
    }
    
    
}

// MARK: - ArticleDisplayLogic

extension ArticleViewController: ArticleDisplayLogic {
    func updateData() {
        print("update")
            self.tableView.reloadData()
    }
    
    func dispayData(_ articles: [NewsModel]) {
        print("display \(articles.count)")
        dataToDisplay.append(contentsOf: articles)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
}



//
//  WebViewController.swift
//  dopasiletskiyPW5_2
//
//  Created by Даниил Пасилецкий on 19.11.2021.
//

import UIKit
import WebKit

class WebController: UIViewController, WKUIDelegate {
    
    var newsURL: URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        webView.pinRight(to: view)
        webView.pinLeft(to: view)
        webView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func loadURL(url: URL) {
        
        newsURL = url
        webView.load(URLRequest(url: url))
    }
    
   
      var webView: WKWebView = {
         let webConfiguration = WKWebViewConfiguration()
         let webView = WKWebView(frame: .zero, configuration: webConfiguration)
         webView.translatesAutoresizingMaskIntoConstraints = false
         return webView
     }()
     
     
 }



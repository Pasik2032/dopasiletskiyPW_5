//
//  WebViewController.swift
//  dopasiletskiyPW5_2
//
//  Created by Даниил Пасилецкий on 19.11.2021.
//

import UIKit
import WebKit

class WebController: UIViewController, WKUIDelegate {
    
    var url: URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        webView.pinRight(to: view)
        webView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        guard let urlOk = url else {
            return
        }
        print(urlOk)
        webView.load(URLRequest(url: urlOk))
    }
    
   
      var webView: WKWebView = {
         let webConfiguration = WKWebViewConfiguration()
         let webView = WKWebView(frame: .zero, configuration: webConfiguration)
         webView.translatesAutoresizingMaskIntoConstraints = false
         return webView
     }()
     
     
 }



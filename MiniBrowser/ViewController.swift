//
//  ViewController.swift
//  MiniBrowser
//
//  Created by Timothy Myers on 7/16/17.
//  Copyright © 2017 Denver Coder. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func loadView() {
        
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func openTapped() {
        
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "itunesconnect.apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "developer.apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "admob.com", style: .default, handler: openPage))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction!) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}


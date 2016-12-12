//
//  NewsArticleDetailViewController.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/11/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class NewsArticleDetailViewController: UIViewController {
   
   @IBOutlet weak var webViewOutlet: UIWebView!
   
   var url: String?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      webViewOutlet.loadRequest(URLRequest(url: URL(string: url!)!))
   }
}

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
   
   @IBOutlet weak var apiName: UILabel!
   
   var url: String?
   var source: String?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      apiName.text = source
      
      webViewOutlet.loadRequest(URLRequest(url: URL(string: url!)!))
   }
}

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
      
      let sourceBKColor = source == "Mashable" ? UIColor.blue : UIColor.red
      apiName.backgroundColor = sourceBKColor
      
      webViewOutlet.loadRequest(URLRequest(url: URL(string: url!)!))
   }
   
   @IBAction func backPressed(_ sender: Any) {
      performSegue(withIdentifier: "NewsArticleDetailViewController_to_NewArticleViewController", sender: source?.lowercased())
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "NewsArticleDetailViewController_to_NewArticleViewController" {
         let destination = segue.destination as! NewArticleViewController
         destination.source = source!.lowercased()
      }
   }
   
}

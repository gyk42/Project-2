//
//  NewsArticleDetailViewController.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/11/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class NewsArticleDetailViewController: UIViewController {
   
   // MARK IBOutlet ----------------------------------------------------------------
   
   @IBOutlet weak var webViewOutlet: UIWebView!
   @IBOutlet weak var apiName: UILabel!
   

   var url: String?
   var source: String?
   
   // MARK: override -------------------------------------------------------------
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      apiName.text = source      
      webViewOutlet.loadRequest(URLRequest(url: URL(string: url!)!))
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "NewsArticleDetailViewController_to_NewArticleViewController" {
         let destination = segue.destination as! NewArticleViewController
         destination.source = source!.lowercased()
      }
   }
   
   // MARK: IBAction ------------------------------------------------------------------
   
   @IBAction func backPressed(_ sender: Any) {
      performSegue(withIdentifier: "NewsArticleDetailViewController_to_NewArticleViewController", sender: source?.lowercased())
   }   
}

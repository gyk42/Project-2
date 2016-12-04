//
//  NewArticleViewController.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/3/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class NewArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   // IBOutlet ------------------------------------------------------------------------
   
   @IBOutlet weak var newsOutlet: UITableView!
   
   
   var articles: [NewsArticles]? = []
   // tableView ------------------------------------------------------------------------
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  1
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsArticleTableViewCell
      
      return cell
      
   }
   
   // Override ------------------------------------------------------------------------
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fetchNewsArticles()
   }
   
   func fetchNewsArticles() {
      let apiKey = "df560ed5464d4ed8831e5623034e81f7"
      let newsSource = "cnn"
      let sortBy = "top"
      let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=" + newsSource + "&sortBy=" + sortBy + "&apiKey=" + apiKey)!)
      
      let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
         
         if error != nil  {
            print(error!)
            return
         }
         
         
         do {
            let objectData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
            if let newsArticlesFromJson = objectData["articles"] as? [String : Any] {
               for newsArticleFromJson in newsArticlesFromJson {
                  
                  
                  if (newsArticlesFromJson["author"] as? String) != nil {
                     
                  }
                  
                  
                  //                 // let article = NewsArticles()
                  //
                  //                  if let author = newsArticleFromJson["author"] as? String {
                  //                     article.author = author
                  //                  }
                  //
                  //                  let title = newsArticleFromJson["title"] as? String
                  //                  let description = newsArticleFromJson["description"] as? String
                  //                  let url = newsArticleFromJson["url"] as? String
                  //                  let urlToImage = newsArticleFromJson["urlToImage"] as? String
                  
               }
            }
            
            /*
             "author": "Stephen Collinson, CNN",
             "title": "Trump's campaign style lost in translation",
             "description": "Donald Trump anchored his presidential campaign on defying convention and flouting political norms, and it worked better than anyone ever expected.",
             "url": "http://www.cnn.com/2016/12/03/politics/donald-trump-china-taiwan-foreign-policy/index.html",
             "urlToImage": "http://i2.cdn.cnn.com/cnnnext/dam/assets/161203172218-tsai-ing-wen-donald-trump-xi-jinping-composite-super-tease.jpg",
             
             */
            
         } catch {
            print(error.localizedDescription)
         }
      }
      
      task.resume()
      
   }
   
}


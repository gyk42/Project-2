//
//  NewsApi.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/8/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import Foundation

class NewsApi {
   
   func fetchNewsArticles(closure: @escaping ([NewsArticle]?) -> ()) {
      let apiKey = "df560ed5464d4ed8831e5623034e81f7"
      let newsSource = "cnn"
      let sortBy = "top"
      let endpoint = "https://newsapi.org/v1/articles?source=\(newsSource)&sortBy=\(sortBy)&apiKey=\(apiKey)"
      let url = URLRequest(url: URL(string: endpoint)!)
      let session = URLSession(configuration: URLSessionConfiguration.default)
      let task = session.dataTask(with: url) {(data, response, error) in
         let jasonObject = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : Any]
         let newsArticles = self.fetchArticle(jasonObject)
         
         DispatchQueue.main.async {
            closure(newsArticles)
         }
      }
      task.resume()
   }


   func fetchArticle(_ json: [String: Any]) -> [NewsArticle] {
   
      let articleList = json["articles"] as! [[String: Any]]
      
      var newsArticles = [NewsArticle]()
      
      for newsArticle in articleList {
         let author = newsArticle["author"] as! String
         let title = newsArticle["title"] as! String
         let description = newsArticle["description"] as! String
         let url = newsArticle["url"] as! String
         let urlToImage = newsArticle["urlToImage"] as! String
      
         let newsArticle = NewsArticle(author, title, description, url, urlToImage)
         
         newsArticles.append(newsArticle)
      }
      
      return newsArticles
   }
}


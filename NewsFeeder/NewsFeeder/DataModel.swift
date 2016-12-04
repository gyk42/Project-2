//
//  NewsArticleData.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/3/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit
import Foundation


class NewsArticles {
   var author: String
   var title: String
   var description: String
   var url: String
   var urlToImage: String
   
   init(_ author: String, _ title: String, _ description: String, url: String, urlToImage: String) {
      self.author = author
      self.title = title
      self.description = description
      self.url = url
      self.urlToImage = urlToImage
      // conveninence init
   }
}

//func fetchData(closure: @escaping (Data) -> ()) {
//   let apiKey = "df560ed5464d4ed8831e5623034e81f7"
//   let newsSource = "cnn"
//   let endpoint = "https://newsapi.org/v1/articles?source=\(newsSource)&sortBy=top&apiKey=" + apiKey
//   let url = URLRequest(url: URL(string: endpoint)!)
//   let session = URLSession(configuration: URLSessionConfiguration.default)
//   let task = session.dataTask(with: url) {(data, response, error) in
//      
//      guard let responseData = data else {
//         print("Error: did not receive data")
//         return
//      }
//      
//      DispatchQueue.main.async {
//         closure(responseData)
//      }
//   }
//   
//   task.resume()
//}





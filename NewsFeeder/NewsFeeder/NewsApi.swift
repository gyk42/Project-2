//
//  NewsApi.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/8/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import Foundation

//let rememberedDirection = currentDirection
//currentDirection = .east

class NewsApi {
   
   static func parseNewsJson(data: Data, closure: @escaping ([Article?]) -> ()) {
      
      if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [String: Any] {
         
         let articlesJSON = jsonObject["articles"] as! [[String: Any]]
         
         var articles: [Article] = []
         
         for articleJSON in articlesJSON {
            let article = Article(jsonObject: articleJSON)
            articles.append(article)
         }
         
         DispatchQueue.main.async {
            closure(articles)
         }
      }
   }
   
   static func fetchNewsArticles(source: String, sortBy: String, closure: @escaping ([Article?]) -> ()) {
      
      let apiKey = "df560ed5464d4ed8831e5623034e81f7"
      //let sortBy = "top"
      
      let url = URL(string: "https://newsapi.org/v1/articles?source=\(source)&sortBy=\(sortBy)&apiKey=\(apiKey)")!
      URLSession.shared.dataTask(with: url) { (data, _, _) in
         guard let responseData = data else {
            closure([nil])
            return
         }
         
         parseNewsJson(data: responseData, closure: closure)
      }.resume()
   }
}


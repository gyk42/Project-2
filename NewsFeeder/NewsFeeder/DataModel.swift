//
//  NewsArticleData.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/3/16.
//  Copyright © 2016 Grace Yu. All rights reserved.


import Foundation

class Article {
   var author: String
   var title: String
   var description: String
   var url: String
   var urlToImage: String
   var publishedAt: String
   
   init(jsonObject: [String : Any]) {
      author = jsonObject["author"] as? String ?? "Unknown"
      title = jsonObject["title"] as? String ?? "Unknown"
      description = jsonObject["description"] as? String ?? "Unknown"
      url = jsonObject["url"] as? String ?? "Unknown"
      urlToImage = jsonObject["urlToImage"] as? String ?? "Unknown"
      publishedAt = jsonObject["publishedAt"] as? String ?? "Unknown"
   }
}

//class Feed {
//   var source: String
//   var sortBy: String
//   var articles: [Articles]
//   
//   init(jsonObject: [String : Any]) {
//      source = jsonObject["source"] as? String ?? "Unknown"
//      sortBy = jsonObject["sortBy"] as? String ?? "Unknown"
//      
//      let art = jsonObject["articles"] as? [String : Any] ?? [String : Any]()
//      articles = [Articles(jsonObject: art)]
//   }
//}

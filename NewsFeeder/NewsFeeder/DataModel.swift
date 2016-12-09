//
//  NewsArticleData.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/3/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import Foundation

class NewsArticle {
   var author: String
   var title: String
   var description: String
   var url: String
   var urlToImage: String
   
   init(_ author: String, _ title: String, _ description: String, _ url: String, _ urlToImage: String) {
      self.author = author
      self.title = title
      self.description = description
      self.url = url
      self.urlToImage = urlToImage
      // conveninence init
   }
}

//
//  NewArticleViewController.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/3/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class NewArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   var articles = [Article]()

   // IBOutlet ------------------------------------------------------------------------
   
   @IBOutlet weak var newsOutlet: UITableView!
   
   //var article: [NewsArticle]? = []
   // tableView ------------------------------------------------------------------------
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return articles.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsArticleTableViewCell
      
      cell.newsTitleOulet.text = articles[indexPath.row].title
      cell.newsAuthorOutlet.text = articles[indexPath.row].author
      cell.newsDescOutlet.text = articles[indexPath.row].description
      cell.newsImageOutlet.downLoadImag(from: articles[indexPath.row].urlToImage)

      return cell
      
   }
   
   // Override ------------------------------------------------------------------------
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fetchNewsArticles(closure: {data in
         self.newsOutlet.reloadData()
      })
   }
   
   func parseNewsJson(data: Data, closure: @escaping ([Article?]) -> ()) {
      //let article: Article? = nil
      if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [String: Any] {
         
         let articlesJSON = jsonObject["articles"] as! [[String: Any]]
         
         for articleJSON in articlesJSON {
            let article = Article(jsonObject: articleJSON)
            self.articles.append(article)
         }
         DispatchQueue.main.async {
            closure(self.articles)
         }
      }
      
//      if !Thread.isMainThread {
//         
//         DispatchQueue.main.async {
//            closure([article])
//         }
//         
//      }
   }
   
   func fetchNewsArticles(closure: @escaping ([Article?]) -> ()) {
      let apiKey = "df560ed5464d4ed8831e5623034e81f7"
      let source = "newsweek"
      let sortBy = "top"
      let url = URL(string: "https://newsapi.org/v1/articles?source=\(source)&sortBy=\(sortBy)&apiKey=\(apiKey)")!
      URLSession.shared.dataTask(with: url) { (data, _, _) in
         guard let responseData = data else {
            closure([nil])
            return
         }
         
         self.parseNewsJson(data: responseData, closure: closure)
      }.resume()
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! NewsArticleDetailViewController
      webVC.url = self.articles[indexPath.row].url
      
      self.present(webVC, animated: true, completion: nil)
   }
}

extension UIImageView {
   func downLoadImag(from url: String) {
      let urlRequest = URLRequest(url: URL(string: url)!)
      let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
         guard let data = data, error == nil else { return }
         
         DispatchQueue.main.async {
            self.image = UIImage(data: data)
         }
      }
      task.resume()
   }
}
   



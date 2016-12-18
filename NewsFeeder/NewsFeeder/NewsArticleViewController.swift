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
   var source = String()
   var menuShowing = false
   
   @IBOutlet weak var apiName: UILabel!
   // IBOutlet ------------------------------------------------------------------------
   
   @IBOutlet weak var newsOutlet: UITableView!
   @IBOutlet weak var menuOutlet: UIView!
   @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
   
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
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! NewsArticleDetailViewController
      webVC.url = self.articles[indexPath.row].url
      webVC.source = self.apiName.text!
      
      self.present(webVC, animated: true, completion: nil)
   }
   
   
   //   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   //      if segue.identifier == "NewArticleViewController_to_NewsArticleDetailViewController" {
   //         let destination = segue.destination as! NewsArticleDetailViewController
   //         destination.source = sender as! String
   //      }
   //   }
   
   // Override ------------------------------------------------------------------------
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      NewsApi.fetchNewsArticles(source: source, closure: {data in
         self.articles = data as! [Article]
         self.newsOutlet.reloadData()
         
         
         switch self.source {
         case "cnn":
            self.apiName.text = "CNN"
         case "mashable":
            self.apiName.text = "Mashable"
            self.apiName.backgroundColor = UIColor.blue
         case "newsweek":
            self.apiName.text = "Newsweek"
         default:
            self.apiName.text = "No news agency"
         }
      })
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      newsOutlet.reloadData()
   }
   
   // IBAction -----------------------------------------------------
   
   @IBAction func menuOpenPressed(_ sender: Any) {
      if menuShowing {
         menuLeadingConstraint.constant = -170
      } else {
         menuLeadingConstraint.constant = 0
      }
      
      menuShowing = !menuShowing
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




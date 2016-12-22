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
   
   var sortBysAvailable = String()
   
   // MARK: IBOutlet --------------------------------------------------------------
   
   @IBOutlet weak var apiName: UILabel!
   @IBOutlet weak var newsOutlet: UITableView!
   @IBOutlet weak var menuOutlet: UIView!
   @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!

   // MARK: tableView --------------------------------------------------------------
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return articles.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsArticleTableViewCell
      
      let articlesRow = articles[indexPath.row]
      
      cell.newsTitleOulet.text = articlesRow.title
      cell.newsAuthorOutlet.text = articlesRow.author
      cell.newsDescOutlet.text = articlesRow.description
      cell.newsImageOutlet.downLoadImag(from: articlesRow.urlToImage)
      
      return cell
      
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! NewsArticleDetailViewController
      webVC.url = self.articles[indexPath.row].url
      webVC.source = self.apiName.text!
      
      self.present(webVC, animated: true, completion: nil)
   }
   
   // MARK: Override -------------------------------------------------------------
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      NewsApi.fetchNewsArticles(source: source, sortBysAvailable: sortBysAvailable, closure: {data in
         self.articles = data as! [Article]
         self.newsOutlet.reloadData()
         
         if self.sortBysAvailable.isEmpty {
            self.sortBysAvailable = "top"
         }
         
         switch self.source {
         case "cnn":
            self.apiName.text = "CNN"
            self.apiName.backgroundColor = UIColor.red
         case "mashable":
            self.apiName.text = "Mashable"
            self.apiName.backgroundColor = UIColor.blue
         case "newsweek":
            self.apiName.text = "Newsweek"
            self.apiName.backgroundColor = UIColor.red
         default:
            self.apiName.text = "No news agency"
         }
         
         print("sortBysAvailable: \(self.sortBysAvailable)")
      })
      newsOutlet.reloadData()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      newsOutlet.reloadData()
   }
   
   // MARK: IBAction -----------------------------------------------------
   
   @IBAction func menuOpenPressed(_ sender: Any) {
      if menuShowing {
         menuLeadingConstraint.constant = -170
      } else {
         menuLeadingConstraint.constant = 0
      }
      
      menuShowing = !menuShowing
   }
   
   @IBAction func topTapBarPressed(_ sender: Any) {
      sortBysAvailable = "top"
      NewsApi.fetchNewsArticles(source: source, sortBysAvailable: "top", closure: { articles in
         self.newsOutlet.reloadData()
      })
   }
   
   @IBAction func lastestTapBarPressed(_ sender: Any) {
      sortBysAvailable = "latest"
      NewsApi.fetchNewsArticles(source: source, sortBysAvailable: "latest", closure: { articles in
         self.newsOutlet.reloadData()
      })
   }

   @IBAction func popularTapBarPressed(_ sender: Any) {
      sortBysAvailable = "popular"
      NewsApi.fetchNewsArticles(source: source, sortBysAvailable: "popular", closure: { articles in
         self.newsOutlet.reloadData()
      })
   }
}

// MARK: Extention ---------------------------------------------------------

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




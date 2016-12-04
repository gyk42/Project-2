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
      
   }
}


//
//  NewsArticleTableViewCell.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/3/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class NewsArticleTableViewCell: UITableViewCell {

   @IBOutlet weak var newsImageOutlet: UIImageView!
   
   @IBOutlet weak var newsTitleOulet: UILabel!
   
   @IBOutlet weak var newsDescOutlet: UILabel!
   
   @IBOutlet weak var newsAuthorOutlet: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

//
//  SplashViewController.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/9/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
   @IBOutlet weak var cnnButton: UIButton!
   @IBOutlet weak var mashableButton: UIButton!
   @IBOutlet weak var newsweekButton: UIButton!

   @IBAction func buttonTouchUpInside(_ sender: UIButton) {
      switch sender {
      case cnnButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "cnn")
      case mashableButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "mashable")
      case newsweekButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "newsweek")
      default:
         ()
      }
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "SplashViewController_to_NewArticleViewController" {
         let destination = segue.destination as! NewArticleViewController
         destination.source = sender as! String
      }
   }
}

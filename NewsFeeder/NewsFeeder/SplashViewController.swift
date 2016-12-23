//
//  SplashViewController.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/9/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
   
   @IBOutlet weak var nymButton: UIButton!
   @IBOutlet weak var reutersButton: UIButton!
   @IBOutlet weak var usaButton: UIButton!
   @IBOutlet weak var timeButton: UIButton!
   @IBOutlet weak var apButton: UIButton!
   
   @IBAction func buttonTouchUpInside(_ sender: UIButton) {
      switch sender {
      case nymButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "new-york-magazine")
      case reutersButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "reuters")
      case usaButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "usa-today")
      case timeButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "time")
      case apButton:
         performSegue(withIdentifier: "SplashViewController_to_NewArticleViewController", sender: "associated-press")
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

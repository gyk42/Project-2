//
//  Extention.swift
//  NewsFeeder
//
//  Created by Yoon Yu on 12/23/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import Foundation
import UIKit
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

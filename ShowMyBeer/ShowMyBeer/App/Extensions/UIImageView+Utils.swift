//
//  UIImageView+Utils.swift
//  ShowMyBeear
//
//  Created by Fabio Souza de Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import UIKit

extension UIImageView {
    func cacheImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let imageCache = NSCache<AnyObject, AnyObject>()

        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            completion(imageFromCache)
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self.image = imageToCache
                completion(self.image)
            }
        }.resume()
    }
}


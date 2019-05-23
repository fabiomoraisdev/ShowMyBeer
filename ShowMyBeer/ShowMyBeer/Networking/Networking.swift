//
//  Networking.swift
//  ShowMyBeear
//
//  Created by Fabio Souza Morais on 20/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import Foundation

class Networking: NSObject {
    typealias responseSuccess = (_ response: Data?) -> ()
    typealias responseFailure = (_ response: String) -> ()
    
    func fetchData(method: String, page: Int, completionSuccess: @escaping responseSuccess, completionFailure: @escaping responseFailure) {
        
        guard let url = URL(string: Constants.URL.baseUrl) else { return }
        
        let parameters = ["page" : "\(page)"]

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters.map{ key, value in
            URLQueryItem(name: key, value: value)
        }
        
        guard let newUrlRequest = urlComponents?.url else { return }
        
        var urlRequest = URLRequest(url: newUrlRequest)
        urlRequest.httpMethod = method
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data else {
                completionFailure(error?.localizedDescription ?? "")
                return
            }
            
            completionSuccess(data)
            }.resume()
    }
}


extension Collection {
    func noDuplicates() -> [Beer]? {
        let beers = (self as? [Beer] ?? [])
        var result = [Beer]()
        for beer in beers {
            let hasDuplicates = result.filter({ $0.id == beer.id }).count > Int()
            if !hasDuplicates {
                result.append(beer)
            }
        }
        return result
    }
}

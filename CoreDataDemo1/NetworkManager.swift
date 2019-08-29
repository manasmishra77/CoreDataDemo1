//
//  NetworkManager.swift
//  CoreDataDemo1
//
//  Created by Manas Mishra on 29/08/19.
//  Copyright © 2019 Manas Mishra. All rights reserved.
//

import UIKit

typealias ResponseSuccessBlock = (_ isSuccess: Bool, _ model: HeadLinesModel?) -> Void
typealias SuccessCompletionBlock   = (_ isSuccess: Bool) -> Void

class NetworkManager: NSObject {
    class func getHeadLines(completion: ResponseSuccessBlock?) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6170b8c935cf46a396bb7398a8141515"
        guard let url = URL(string: urlString) else {
            completion?(false, nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let datatask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {return}
            guard let response = response as? HTTPURLResponse else {return}
            guard response.statusCode == 200, let data = data else {
                completion?(false, nil)
                return
            }
            if let model = try? JSONDecoder().decode(HeadLinesModel.self, from: data) {
                completion?(true, model)
                return
            }
            completion?(false, nil)
        }
        datatask.resume()
    }
}


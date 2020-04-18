//
//  WebServiceHandler.swift
//  SilverLinkTest
//
//  Created by Raj Kadam on 18/04/20.
//  Copyright © 2020 Raj Kadam. All rights reserved.
//

import Foundation

class WebServiceHandler {
    // MARK: Get Request
    // swiftlint:disable:next line_length
    func get(url: URL, parameter: [String: AnyObject]?, completion: @escaping (Bool, Data?, HTTPURLResponse?, Error?) -> Void ) {
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        DispatchQueue.global(qos: .userInitiated).async {
               let sessionConfiguration = URLSessionConfiguration.default
               let session = URLSession(configuration: sessionConfiguration)
               let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                   completion(true, data, response as? HTTPURLResponse, error)
               })
               task.resume()
           }
    }
}

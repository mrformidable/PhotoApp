//
//  NetworkService.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-19.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask(with: URLRequest,
                  completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSession: URLSessionProtocol {
    func dataTask(with: URLRequest,
                  completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        return dataTask(with: request.url!, completionHandler: completionHandler)
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

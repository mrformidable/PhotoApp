//
//  NetworkService.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-19.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskCompletion = (Data?, URLResponse?, Error?) -> Void
    func dataTask(with: URLRequest,
                  completionHandler: @escaping DataTaskCompletion) -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, 
                  completionHandler: @escaping DataTaskCompletion) -> URLSessionDataTaskProtocol {
        return dataTask(with: request.url!, completionHandler: completionHandler)
    }
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

protocol NetworkService {
    var session: URLSessionProtocol { get }
    func fetch<T: Codable>(with url: URL, completion: @escaping (Result<T>) -> Void)
}

extension NetworkService {
    func fetch<T: Codable>(with url: URL, completion: @escaping (Result<T>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                do {
                    let json = try JSONDecoder().decode([T].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(json))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }
        task.resume()
    }
}


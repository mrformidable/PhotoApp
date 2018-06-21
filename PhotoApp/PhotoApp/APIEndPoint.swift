//
//  APIEndPoint.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-20.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation

protocol ApiEndPoint {
    var baseUrl: String { get }
    var path: String { get }
    var urlQueryItems: [URLQueryItem] { get }
}

extension ApiEndPoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseUrl)
        components?.path = path
        components?.queryItems = urlQueryItems
        return components!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponents.url!)
    }
}

enum UnsplashApiEndPoint: ApiEndPoint {
    case curatedPhotos(perPage: Int, sortedBy: SortedPhoto)
    
    var baseUrl: String {
        return "https://api.unsplash.com"
    }
    
    var apiKey: String {
        return "f92a7e8c58fcd64f17093ef038ad28548cbca5971d84b60c0fd8401ae9619004"
    }
    
    var path: String {
        switch self {
        case .curatedPhotos:
            return "/photos/curated"
        }
    }
    
    var urlQueryItems: [URLQueryItem] {
        switch self {
        case .curatedPhotos(let perPage, let sorted):
            return [URLQueryItem(name: ParameterKeys.clientId.rawValue, value: apiKey),
            URLQueryItem(name: ParameterKeys.perPage.rawValue, value: String(perPage)),
            URLQueryItem(name: ParameterKeys.orderBy.rawValue, value: sorted.rawValue)]
        }
    }
}

extension UnsplashApiEndPoint {
    private enum ParameterKeys: String {
        case clientId = "client_id"
        case perPage = "per_page"
        case orderBy = "order_by"
    }
    
    enum SortedPhoto: String {
        case latest = "latest"
        case oldest = "oldest"
        case popular = "popular"
    }
}







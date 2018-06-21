//
//  PhotoApiNetworkService.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-19.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation

class PhotoApiNetworkService: NetworkService {
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchPhotos(request: URLRequest, _ completion: @escaping (Result<Photo>) -> Void) {
        fetch(with: request, completion: completion)
    }
}

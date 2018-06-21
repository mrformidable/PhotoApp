//
//  PhotoApiServiceTests.swift
//  PhotoAppTests
//
//  Created by Michael A on 2018-06-19.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import XCTest
@testable import PhotoApp

class PhotoApiServiceTests: XCTestCase {
    
    func test_photoApiCalls_fetchPhotos() {
        let service = MockPhotoApiNetworkService()
        let apiEndpoint = UnsplashApiEndPoint.curatedPhotos(perPage: 10, sortedBy: .latest)
        service.fetchPhotos(with: apiEndpoint) { _ in }
        XCTAssertTrue(service.fetchGotCalled)
    }
    
    class MockPhotoApiNetworkService: PhotoApiNetworkService {
        private(set) var fetchGotCalled = false
        
        override func fetchPhotos(with endpoint: UnsplashApiEndPoint, _ completion: @escaping (Result<Photo>) -> Void) {
            fetchGotCalled = true
        }
    }
}


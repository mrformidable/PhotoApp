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
        let url = URL(fileURLWithPath: "")
        service.fetchPhotos(url: url) { (_) in }
        XCTAssertTrue(service.fetchGotCalled)
    }
    
    class MockPhotoApiNetworkService: PhotoApiNetworkService {
        private(set) var fetchGotCalled = false
        
        override func fetchPhotos(url: URL, _ completion: @escaping (Result<Photo>) -> Void) {
            fetchGotCalled = true
        }
    }
}


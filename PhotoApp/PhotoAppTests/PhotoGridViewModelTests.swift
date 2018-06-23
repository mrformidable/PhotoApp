//
//  PhotoGridViewModelTests.swift
//  PhotoAppTests
//
//  Created by Michael A on 2018-06-21.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import XCTest
@testable import PhotoApp

class PhotoGridViewModelTests: XCTestCase {
    
    var sut: PhotoGridViewModel!
    
    let photoApiService = PhotoApiNetworkService()
    
    override func setUp() {
        super.setUp()
        sut = PhotoGridViewModel(networkService: photoApiService)
    }
    
    func test_sutNetworkServiceProvider_isPhotoApiNetworkService() {
        XCTAssertTrue(sut.networkService is PhotoApiNetworkService, "Expected PhotoApiNetworkService to be the network provider")
    }
    
    
    
    class MockPhotoGridViewModel: PhotoGridViewModelProtocol {
        
        var networkService: NetworkService = PhotoApiNetworkService()
        
        var fetchingError: ((NetworkError) -> Void)?
        
        var fetchingPhotos: (() -> Void)?
        
        var didFinishFetch: (([Photo]) -> Void)?
        
        func fetchPhotos(forPage page: Int) {
            
        }
        
    }
    
}

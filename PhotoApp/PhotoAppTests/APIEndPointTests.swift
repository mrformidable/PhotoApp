//
//  APIEndPointTests.swift
//  PhotoAppTests
//
//  Created by Michael A on 2018-06-20.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import XCTest
@testable import PhotoApp

class APIEndPointTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    func test_apiEndPoint_correctlySetsBaseUrl_whenGivenBaseUrl() {
        var mockEndPoint = MockApiEndPoint()
        let baseURL = "https://test.com"
        mockEndPoint.baseUrl = baseURL
        XCTAssertEqual(mockEndPoint.baseUrl, baseURL)
    }
    
    func test_apiEndPoint_correctlySetsUrlPath_whenGivenUrlPath () {
        var mockEndPoint = MockApiEndPoint()
        let path = "/testPath"
        mockEndPoint.path = path
        XCTAssertEqual(mockEndPoint.path, path)
    }
    
    func test_apiEndPoint_correctlySetsQueryItems_whenGivenQueryItems() {
        var mockEndPoint = MockApiEndPoint()
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "qKey", value: "qValue"),
            URLQueryItem(name: "q2Key", value: "q2Value"),
        ]
        mockEndPoint.urlQueryItems = queryItems
        XCTAssertEqual(mockEndPoint.urlQueryItems.count, 2)
    }
    
    func test_apiEndPoint_returnsCorrectComponents_whenGivenURLComponents() {
        var mockEndPoint = MockApiEndPoint()
        let baseURL = "https://test.com"
        let path = "/testPath"
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "qKey", value: "qValue"),
            ]
        mockEndPoint.baseUrl = baseURL
        mockEndPoint.path = path
        mockEndPoint.urlQueryItems = queryItems
 
        let queryItem = "\(queryItems.first!.name)=\(queryItems.first!.value!)"
        let urlString = "\(baseURL)\(path)?\(queryItem)"
        let apiURL = URL(string: urlString)
        
        XCTAssertEqual(mockEndPoint.urlComponents.queryItems!, queryItems)
        XCTAssertEqual(mockEndPoint.urlComponents.path, path)
        XCTAssertEqual(mockEndPoint.urlComponents.url, apiURL)
    }
    
    struct MockApiEndPoint: ApiEndPoint {
        var baseUrl: String = ""
        var path: String = ""
        var urlQueryItems: [URLQueryItem] = []
        
    }
}










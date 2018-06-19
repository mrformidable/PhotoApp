//
//  PhotoTests.swift
//  PhotoAppTests
//
//  Created by Michael A on 2018-06-19.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import XCTest
@testable import PhotoApp

class PhotoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_photoModelCorrectly_decodesData() {
        let json: [String: Any] = [
            "id": "12345",
            "height": 200,
            "width": 300,
            "updated_at": "2018-06-17T20:28:11-04:00",
            "created_at": "2018-06-17T20:28:11-04:00",
            "urls": [
                "raw": "https://www.myImage.com/raw",
                "full": "https://www.myImage.com/full",
                "regular": "https://www.myImage.com/regular",
                "small": "https://www.myImage.com/small",
                "thumb": "https://www.myImage.com/thumb"
            ],
            "likes": 50
        ]
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else {
            XCTFail("expected valid data")
            return
        }
        guard let photo = try? JSONDecoder().decode(Photo.self, from: data) else {
            XCTFail("Error decoding: data")
            return
        }
        XCTAssertEqual(photo.id, "12345")
        XCTAssertEqual(photo.height, 200)
        XCTAssertEqual(photo.width, 300)
        XCTAssertEqual(photo.likes, 50)
    }
    
    func test_photoModel_doesNot_decodeIncorrectFields() {
         let incompleteJson: [String: Any] = [
            "id": "12345",
            "height": 200,
            "width": 300,
            "creation_date": "2018-06-17T20:28:11-04:00"
        ]
        guard let data = try? JSONSerialization.data(withJSONObject: incompleteJson, options: .prettyPrinted) else {
            XCTFail("expected valid data")
            return
        }
         let photo = try? JSONDecoder().decode(Photo.self, from: data)
         XCTAssertNil(photo)
        
    }


}







//
//  DetailPhotoDataProviderTests.swift
//  PhotoAppTests
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import XCTest
@testable import PhotoApp

class DetailPhotoDataProviderTests: XCTestCase {
    
    var sut: DetailPhotoDataProvider!
    var collectionView: UICollectionView!
    var controller: DetailPhotoViewController!
    
    override func setUp() {
        super.setUp()
        
        sut = DetailPhotoDataProvider()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "DetailPhotoViewController") as! DetailPhotoViewController
        _ = controller.view
        
        collectionView = controller.collectionView
        collectionView.dataSource = sut
    }
    
    func test_numberOfSections_isOne() {
        let numberOfSection = collectionView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func test_numberOfItems_isInitiallyZero() {
        let numberOfRows = collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfRows, 0)
    }
    
    func test_numberOfItemsIncreasesByOne_whenPhotoIsAdded() {
        let photo = Photo(id: "abc123", createDate: "", updatedDate: "", width: 0, height: 0, imageUrls: nil, likes: 0)
        sut.photos.append(photo)
        let numberOfRows = collectionView.numberOfItems(inSection: 0)
        XCTAssertEqual(numberOfRows, 1)
    }
    
    func test_cellForRow_returnsDetailPhotoCell() {
        let photo =  Photo(id: "abc123", createDate: "", updatedDate: "", width: 0, height: 0, imageUrls: nil, likes: 0)
        sut.photos.append(photo)
        collectionView.reloadData()
        XCTAssertEqual(sut.photos.count, 1)
        
        let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
        
        XCTAssertTrue(cell is DetailPhotoCollectionCell)
        
    }
    
}

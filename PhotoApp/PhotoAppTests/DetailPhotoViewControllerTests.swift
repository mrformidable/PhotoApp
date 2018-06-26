//
//  DetailPhotoViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import XCTest
@testable import PhotoApp

class DetailPhotoViewControllerTests: XCTestCase {
    
    var sut: DetailPhotoViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailPhotoViewController") as! DetailPhotoViewController
        sut = viewController
        _ = sut.view
    }
    
    func test_afterViewLoads_collectionViewIsNotNil() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    func test_afterViewLoads_setsDatasource() {
        XCTAssertTrue(sut.collectionView.dataSource is DetailPhotoDataProvider)
    }
    
    func test_afterViewLoads_setsDelegateSource() {
        XCTAssertTrue(sut.collectionView.delegate is DetailPhotoDelegateSource)
    }
    
    func test_detailPhotoCollectionView_scrollsHorizontally () {
        let layout = sut.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        XCTAssertTrue(layout?.scrollDirection == .horizontal)
    }
    
}

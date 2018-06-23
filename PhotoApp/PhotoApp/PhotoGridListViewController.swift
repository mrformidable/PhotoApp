//
//  PhotoGridListViewController.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-21.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import UIKit

class PhotoGridListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let datasource = PhotoGridListDataProvider()
    private let delegateSource = PhotoGridListDelegateSource()
    private let viewModel = PhotoGridViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        viewModel.fetchPhotos(forPage: 1)
        viewModel.didFinishFetch = { photos in
            self.datasource.photos = photos
            print("photo fetch complete.")
            self.collectionView.reloadData()
        }
        
        viewModel.fetchingPhotos = {
            print("fetching photos...")
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = datasource
        collectionView.delegate = delegateSource
    }
}











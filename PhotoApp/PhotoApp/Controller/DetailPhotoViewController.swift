//
//  DetailPhotoViewController.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource = DetailPhotoDataProvider()
    let delegateSource = DetailPhotoDelegateSource()
    var selectedIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = dataSource
        collectionView.delegate = delegateSource
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var indexPath: IndexPath?
        
        if let currentIndexPath = delegateSource.currentIndexPath {
            indexPath = currentIndexPath
        } else {
            indexPath = selectedIndexPath
        }
        NotificationCenter.default.post(name: .selectedIndexPathFromDetailController, object: indexPath)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.layoutIfNeeded()
        collectionView.scrollToItem(at: selectedIndexPath, at: .right, animated: false)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.layoutIfNeeded()
    }
    
    
}

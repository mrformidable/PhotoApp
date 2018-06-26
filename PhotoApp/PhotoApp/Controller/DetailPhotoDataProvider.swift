//
//  DetailPhotoDataProvider.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import UIKit

private let cellIdentifier = "DetailPhotoCollectionCell"

class DetailPhotoDataProvider: NSObject {
    var photos: [Photo] = []
}

extension DetailPhotoDataProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DetailPhotoCollectionCell
        let photo = photos[indexPath.row]
        let detailPhotoViewModel = DetailPhotoCellViewModel(photo)
        cell.displayPhoto(with: detailPhotoViewModel)
        return cell
    }
    
}

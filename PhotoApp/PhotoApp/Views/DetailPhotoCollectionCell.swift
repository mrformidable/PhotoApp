//
//  DetailPhotoCollectionCell.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import UIKit

class DetailPhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func displayPhoto(with viewModel: DetailPhotoCellViewModel) {
        imageView.loadImageCache(with: viewModel.imageUrls?.regular.absoluteString ?? "", completion: nil)
    }
    
    override func prepareForReuse() {
        imageView.layoutIfNeeded()
    }
}

//
//  PhotoGridCollectionCell.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-21.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoGridCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func displayPhoto(with viewModel: PhotoGridCellViewModel) {
        imageView.sd_addActivityIndicator()
        imageView.sd_setIndicatorStyle(.gray)
        imageView.sd_setImage(with: viewModel.imageUrls?.thumb, placeholderImage: #imageLiteral(resourceName: "photo_placeholder"), options: SDWebImageOptions()) { (_, _, _, _) in
            self.imageView.sd_removeActivityIndicator()
        }
    }
}

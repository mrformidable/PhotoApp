//
//  DetailPhotoCollectionCell.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import UIKit
import SDWebImage
class DetailPhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func displayPhoto(with viewModel: DetailPhotoCellViewModel) {
        imageView.sd_addActivityIndicator()
        imageView.sd_setIndicatorStyle(.whiteLarge)
        imageView.sd_setImage(with: viewModel.imageUrls?.regular, placeholderImage: #imageLiteral(resourceName: "photo_placeholder"), options: SDWebImageOptions()) { (_, _, _, _) in
            self.imageView.sd_removeActivityIndicator()
        }
    }
    
}

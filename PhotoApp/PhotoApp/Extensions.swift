//
//  Extensions.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-24.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    static var fetchPhotos: Notification.Name {
        return .init("FetchPhotos")
    }
    
    static var showDetailController: Notification.Name {
        return .init("DetailPhotoController")
    }
    
    static var selectedIndexPathFromDetailController: Notification.Name {
        return .init("SelectedIndexPathFromDetailController")
    }
}

extension UIImage {
    func resizedImage(newSize: CGSize) -> UIImage {
        guard self.size != newSize else { return self }
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
}

//
//  Extensions.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-24.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation


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

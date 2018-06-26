//
//  DetailPhotoDelegateSource.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-25.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoDelegateSource: NSObject {
    private(set) var currentIndexPath: IndexPath?
}

extension DetailPhotoDelegateSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 2)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let width = scrollView.superview?.frame.width else {
            return
        }
        let index = targetContentOffset.pointee.x / width
        let indexPath = IndexPath(row: Int(index), section: 0)
        self.currentIndexPath = indexPath
    }
    
}








//
//  PhotoGridListViewController.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-21.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

class PhotoGridListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingIndicatorView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    private let datasource = PhotoGridListDataProvider()
    private let delegateSource = PhotoGridListDelegateSource()
    private let viewModel = PhotoGridViewModel()
    private var page = 1
    private let photosPerPage = NetworkConfiguration.photosPerPage
    private var selectedPhotoIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        viewModel.fetchPhotos(forPage: page)
        viewModel.didFinishFetch = { [weak self] photos in
            guard let `self` = self else { return }
            photos.forEach { if !self.datasource.photos.contains($0) { self.datasource.photos.append($0) } }
            self.activityIndicatorView.stopAnimating()
            self.collectionView.isHidden = false
            self.loadingIndicatorView.isHidden = true
            self.collectionViewReloading()
        }
        
        viewModel.fetchingPhotos = { [weak self] in
            guard let `self` = self else { return }
            self.activityIndicatorView.startAnimating()
            self.loadingIndicatorView.isHidden = false
        }
        addObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedPhotoIndexPath = selectedPhotoIndexPath {
            collectionView.layoutIfNeeded()
            collectionView.scrollToItem(at: selectedPhotoIndexPath, at: UICollectionViewScrollPosition(), animated: false)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func loadMorePhotos() {
        page += 1
        viewModel.fetchPhotos(forPage: page)
    }
    
    @objc private func showDetailPhotoController(_ notification: Notification) {
        let indexPath = notification.object as? IndexPath
        performSegue(withIdentifier: Constants.SegueIdentifiers.detailPhotoSegueIdentifier, sender: indexPath)
    }
    
    @objc private func updatedPhotoIndexPath(_ notification: Notification) {
        let indexPath = notification.object as? IndexPath
        selectedPhotoIndexPath = indexPath
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(loadMorePhotos), name: .fetchPhotos, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showDetailPhotoController(_:)), name: .showDetailController, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatedPhotoIndexPath(_:)), name: .selectedIndexPathFromDetailController, object: nil)
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = datasource
        collectionView.delegate = delegateSource
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
}

//MARK:- Prepare for segue
extension PhotoGridListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueIdentifiers.detailPhotoSegueIdentifier {
            if let detailPhotoViewController = segue.destination as? DetailPhotoViewController {
                detailPhotoViewController.dataSource.photos =  datasource.photos
                if let indexPath = sender as? IndexPath {
                    detailPhotoViewController.selectedIndexPath = indexPath
                }
            }
        }
    }
}

//MARK:- CollectionView Reloading
extension PhotoGridListViewController {
    private func collectionViewReloading() {
        let lastIndex = datasource.photos.count - 1
        let previousIndexStart = lastIndex - (photosPerPage - 1)
        var indexPaths: [IndexPath] = []
        
        for index in previousIndexStart...lastIndex {
            let indexPath = IndexPath.init(item: index, section: 0)
            indexPaths.append(indexPath)
        }
        
        collectionView.insertItems(at: indexPaths)
        collectionView.reloadItems(at: indexPaths)
        collectionView.scrollToItem(at: IndexPath.init(item: datasource.photos.count - 1, section: 0), at: UICollectionViewScrollPosition.top, animated: true)
    }
}










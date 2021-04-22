//
//  ViewController.swift
//  FlickImages
//
//  Created by Hoang Pham on 19.4.2021.
//

import UIKit

class MainImagesVC: UIViewController {

    var photosListViewModel = PhotosListViewModel()
    
    private var collectionView: UICollectionView!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flickr Images"
      
        configureCollectionView()
        configureSearchController()
        configureActivityIndicator()
        
        viewModelFetchPhotos()
    }
    
    
    func viewModelFetchPhotos(_ searchText: String = "") {
        activityIndicator.startAnimating()

        photosListViewModel.fetchPhotos(searchTerm: searchText) { [weak self ] (result) in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            
            switch result {
            case .success(_):
                self.updateUI()
            case .failure(_):
                self.showAlert(message: "check your internet and try again!")
            }
        }
    }
    
    
    private func updateUI() {
        if photosListViewModel.photosList.isEmpty {
            showAlert(message: "Can't find any photo from your search, try something else!")
            return
        }
        collectionView.reloadData()
    }

    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .lightGray
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    private func configureSearchController() {
        let searchController = UISearchController()
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
    }
    
    
    private func configureActivityIndicator() {
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.center(inView: view)
    }
    
}


// MARK: - ScrollView delegate

extension MainImagesVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // hide search bar when user scroll down
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }

}

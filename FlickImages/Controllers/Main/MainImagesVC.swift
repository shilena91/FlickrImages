//
//  ViewController.swift
//  FlickImages
//
//  Created by Hoang Pham on 19.4.2021.
//

import UIKit

final class MainImagesVC: FIDataLoadingVC {

    var photosListViewModel = PhotosListViewModel()
    
    private var collectionView: UICollectionView!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureNavigationController()
        
        viewModelFetchPhotos()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeywordChosen(notification:)), name: Notification.Name(NotificationConstant.getKeywordName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func viewModelFetchPhotos(_ searchTerm: String? = nil) {
        showLoadingView()

        photosListViewModel.fetchPhotos(searchTerm: searchTerm) { [weak self] (result) in
            guard let self = self else { return }
            self.dismissLoadingView()
            
            switch result {
            case .success(_):
                self.updateUI()
            case .failure(_):
                self.showAlert(message: "check your internet and try again!")
            }
        }
    }

    // MARK: - Private methods
    
    private func updateUI() {
        if photosListViewModel.numberOfItems() == 0 {
            showEmptyStateView(with: "Can't find any photo from your search, try something else!", in: view)
            collectionView.reloadData()
        } else {
            dismissEmptyStateView()
            collectionView.reloadData()
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .bottom, animated: false)
        }
    }

    
    @objc private func onKeywordChosen(notification: Notification) {
        if let keyword = notification.userInfo?[NotificationConstant.getKeywordKey] as? String {
            viewModelFetchPhotos(keyword)
            navigationItem.searchController?.searchBar.text = keyword
        }
    }
    
    
    @objc private func categoriesButtonPressed() {
        let destVC = CategoriesVC()
        let navController = UINavigationController(rootViewController: destVC)

        present(navController, animated: true)
    }
    
    // MARK: - Congigure UI
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .lightGray
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    private func configureNavigationController() {
        let searchController = UISearchController()

        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.title = "Flickr Images"

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Categories", style: .plain, target: self, action: #selector(categoriesButtonPressed))
    }
    
}


// MARK: - ScrollView delegate

extension MainImagesVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // hide search bar when user scroll down
        if (scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
}

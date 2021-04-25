//
//  ViewController.swift
//  FlickImages
//
//  Created by Hoang Pham on 19.4.2021.
//

import UIKit
import Combine

final class MainImagesVC: UIViewController {

    var photosListViewModel = PhotosListViewModel()
    
    private var collectionView: UICollectionView!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        configureCollectionView()
        configureNavigationController()
        configureActivityIndicator()
        
        viewModelFetchPhotos()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeywordChosen(notification:)), name: Notification.Name(NotificationConstant.getKeywordName), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func viewModelFetchPhotos(_ searchText: String = "") {
        activityIndicator.startAnimating()

        let text = searchText.replacingOccurrences(of: " ", with: "+")

//        photosListViewModel.fetchPhotos(searchTerm: text) { [weak self ] (result) in
//            guard let self = self else { return }
//            self.activityIndicator.stopAnimating()
//
//            switch result {
//            case .success(_):
//                self.updateUI()
//            case .failure(_):
//                self.showAlert(message: "check your internet and try again!")
//            }
//        }
        
        cancellable = photosListViewModel.fetchPhotos2(searchTerm: searchText).sink(receiveCompletion: { (error) in
            print(error)
        }, receiveValue: { [weak self] (result) in
            self?.activityIndicator.stopAnimating()
            self?.updateUI()
        })
    }

    // MARK: - Private methods
    
    private func updateUI() {
        if photosListViewModel.numberOfItems() == 0 {
            showAlert(message: "Can't find any photo from your search, try something else!")
            return
        }
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .bottom, animated: false)
    }

    
    @objc private func onKeywordChosen(notification: Notification) {
        if let keyword = notification.userInfo?[NotificationConstant.getKeywordKey] as? String {
            viewModelFetchPhotos(keyword)
            navigationItem.searchController?.searchBar.text = keyword
        }
    }
    
    
    @objc private func categorizeButtonPressed() {
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
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Categorizes", style: .plain, target: self, action: #selector(categorizeButtonPressed))
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

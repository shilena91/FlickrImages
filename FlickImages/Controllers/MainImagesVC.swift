//
//  ViewController.swift
//  FlickImages
//
//  Created by Hoang Pham on 19.4.2021.
//

import UIKit

class MainImagesVC: UIViewController {

    private var photosListViewModel = PhotosListViewModel()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Flickr Images"
      
        configureCollectionView()
        configureSearchController()
        
        viewModelFetchPhotos()
    }
    
    
    fileprivate func viewModelFetchPhotos(_ searchText: String = "") {
        photosListViewModel.fetchPhotos(searchTerm: "") { (result) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
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
    
}

// MARK: - CollectionView Delegate and DataSource

extension MainImagesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosListViewModel.numberOfItems()
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as! PhotoCell
        
        cell.set(photo: photosListViewModel.photosList[indexPath.row])
        
        return cell
    }
}

// MARK: - SearchBar Delegate

extension MainImagesVC: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}

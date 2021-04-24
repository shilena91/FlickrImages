//
//  MainImagesVC+SearchBarDelegate.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

extension MainImagesVC: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            handleFlickrSearch(text)
            let text = searchBar.text
            searchBar.endEditing(true)
            navigationItem.searchController?.isActive = false
            navigationItem.searchController?.searchBar.text = text
        }
    }
    
    
    private func handleFlickrSearch(_ searchText: String) {
        if !searchText.isEmpty {
            viewModelFetchPhotos(searchText)
        }
    }
}

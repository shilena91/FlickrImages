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
    
    
    private func handleFlickrSearch(_ searchTerm: String) {
        let text = searchTerm.trimmingCharacters(in: .whitespaces)
        
        // not calling viewModelFetchPhotos when user enter string with only whitespace
        if text.isEmpty {
            return
        }
        viewModelFetchPhotos(searchTerm)
    }
}

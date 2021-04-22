//
//  MainImagesVC+CollectionViewDelegate.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

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

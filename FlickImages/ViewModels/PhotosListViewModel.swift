//
//  PhotosListViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation
import Combine

final class PhotosListViewModel {
    
    private var photosList = [Photo]()
    private var service: FlickrServiceProtocol = FlickrService.shared

    
    func numberOfItems() -> Int {
        return photosList.count
    }

    
    func getPhoto(byPosition: Int) -> Photo {
        return photosList[byPosition]
    }

    
    func fetchPhotos(searchTerm: String) -> AnyPublisher<Bool, NetworkErrors> {
        return service.fetchPhotos(searchTerm: searchTerm).receive(on: DispatchQueue.main).map({ [weak self] photosModel -> Bool in
            self?.photosList = photosModel.photos.photo
            return true
        }).eraseToAnyPublisher()
        
    }
}

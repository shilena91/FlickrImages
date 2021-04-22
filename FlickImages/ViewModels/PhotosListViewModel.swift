//
//  PhotosListViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation

final class PhotosListViewModel {
    
    private(set) var photosList = [Photo]()
    private var service: PhotosServiceCallProtocol = PhotosServiceCall.shared

    
    func numberOfItems() -> Int {
        return photosList.count
    }

    
    func fetchPhotos(searchTerm: String, completion: @escaping (Result<Bool, NetworkErrors>) -> Void) {
        service.fetchPhotos(searchTerm: searchTerm, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let jsonData):
                self.photosList = jsonData.photos.photo
                DispatchQueue.main.async {
                    completion(.success(true))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        })
    }
}

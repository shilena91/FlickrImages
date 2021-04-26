//
//  PhotosListViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation

final class PhotosListViewModel {
    
    private var photosList = [Photo]()
    private var service: FlickrServiceProtocol?

    
    init(service: FlickrServiceProtocol = FlickrService.shared) {
        self.service = service
    }
    
    
    func numberOfItems() -> Int {
        return photosList.count
    }

    
    func getPhoto(byPosition position: Int) -> Photo {
        return photosList[position]
    }

    
    func fetchPhotos(searchTerm: String, completion: @escaping (Result<Bool, NetworkErrors>) -> Void) {
        guard let service = service else { return }
        
        service.fetchPhotos(searchTerm: searchTerm, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let photosModel):
                self.photosList = photosModel.photos.photo
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

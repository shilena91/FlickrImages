//
//  PhotosListViewModel.swift
//  FlickImages
//
//  Created by Hoang Pham on 20.4.2021.
//

import Foundation

final class PhotosListViewModel {
    
    private var photosList = [Photo]()
    private(set) var service: FlickrServiceProtocol?
    private(set) var searchText: String?

    
    init(service: FlickrServiceProtocol = FlickrService()) {
        self.service = service
    }
    
    
    func numberOfItems() -> Int {
        return photosList.count
    }

    
    func getPhoto(byPosition position: Int) -> Photo {
        return photosList[position]
    }

    
    func fetchPhotos(searchTerm: String?, completion: @escaping (Result<Bool, NetworkErrors>) -> Void) {
        guard let service = service else { return }
        
        searchText = searchTerm?.replacingOccurrences(of: " ", with: "+")

        service.fetchPhotos(searchText: searchText, completion: { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let photosModel):
                self.photosList = photosModel.photos.photo
                DispatchQueue.main.async {
                    completion(.success(true))
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        })
    }
}

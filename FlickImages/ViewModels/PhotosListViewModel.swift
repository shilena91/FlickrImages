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

    
    func fetchPhotos2(searchTerm: String) -> AnyPublisher<Bool, NetworkErrors> {
        return service.fetchPhotos2(searchTerm: searchTerm).receive(on: DispatchQueue.main).map({ [weak self] photosModel -> Bool in
            self?.photosList = photosModel.photos.photo
            return true
        }).eraseToAnyPublisher()
        
//        sink(receiveCompletion: { _ in
//            print("Completion")
//        }, receiveValue: { [weak self] (photoModels) in
//            guard let self = self else { return }
//            self.photosList = photoModels.photos.photo
//        })
    }
}

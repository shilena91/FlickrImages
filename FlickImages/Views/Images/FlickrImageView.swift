//
//  FlickrImage.swift
//  FlickImages
//
//  Created by Hoang Pham on 21.4.2021.
//

import UIKit

final class FlickrImageView: UIImageView {
    
    private let placeholderImage = Images.placeholder
    var service: FlickrServiceProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(from urlString: String) {
        service?.downloadImage(from: urlString) { [weak self] (image) in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if let image = image {
                    self.image = image
                }
            }
        }
    }
}

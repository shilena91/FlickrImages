//
//  FlickrImage.swift
//  FlickImages
//
//  Created by Hoang Pham on 21.4.2021.
//

import UIKit

final class FlickrImageView: UIImageView {
    
    private let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        image = placeholderImage
        layer.cornerRadius = 10
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(from urlString: String) {
        PhotosServiceCall.shared.downloadImage(from: urlString) { [weak self] (image) in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

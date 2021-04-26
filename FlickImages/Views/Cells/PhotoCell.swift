//
//  PhotoCell.swift
//  FlickImages
//
//  Created by Hoang Pham on 21.4.2021.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    static let reuseID = "PhotoCell"
    private let flickrImageView = FlickrImageView(frame: .zero)
    private let imageTitleLabel = FITitleLabel(textAlignment: .center, fontSize: Sizes.imageTitleFontSize, textColor: .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(photo: Photo) {
        imageTitleLabel.text = photo.title
        flickrImageView.downloadImage(from: photo.flickrImageURL())
    }
    
    
    private func configure() {
        backgroundColor = .white

        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.clear.cgColor

        addSubViews(flickrImageView, imageTitleLabel)
                
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            flickrImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            flickrImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            flickrImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            flickrImageView.heightAnchor.constraint(equalTo: flickrImageView.widthAnchor),
            
            imageTitleLabel.topAnchor.constraint(equalTo: flickrImageView.bottomAnchor, constant: 12),
            imageTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            imageTitleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

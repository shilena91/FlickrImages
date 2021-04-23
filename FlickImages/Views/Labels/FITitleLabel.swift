//
//  FITitleLabel.swift
//  FlickImages
//
//  Created by Hoang Pham on 21.4.2021.
//

import UIKit

final class FITitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat, textColor: UIColor) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.textColor = textColor
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 2
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
    }

}

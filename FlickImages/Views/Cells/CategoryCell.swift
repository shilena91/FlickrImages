//
//  CategorizeCell.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

final class CategoryCell: UITableViewCell {
    
    static let reuseId = "CategorizeCell"
    private let titleLabel = FITitleLabel(textAlignment: .left, fontSize: Sizes.categoryFontSize, textColor: .label)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(categorizeName: String, accessoryType: UITableViewCell.AccessoryType) {
        titleLabel.text = categorizeName
        self.accessoryType = accessoryType
    }
    
    private func configure() {
        accessoryType = .disclosureIndicator
        contentView.addSubview(titleLabel)
        
        titleLabel.pinToEdges(of: contentView, padding: 12)
    }
    
}

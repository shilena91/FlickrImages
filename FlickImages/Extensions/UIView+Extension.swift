//
//  UIView+Extension.swift
//  FlickImages
//
//  Created by Hoang Pham on 21.4.2021.
//

import Foundation

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    
    func center(inView view: UIView) {
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
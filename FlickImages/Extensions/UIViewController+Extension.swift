//
//  UIViewController+Extension.swift
//  FlickImages
//
//  Created by Hoang Pham on 22.4.2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Something is wrong", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

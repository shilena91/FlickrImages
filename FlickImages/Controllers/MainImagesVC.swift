//
//  ViewController.swift
//  FlickImages
//
//  Created by Hoang Pham on 19.4.2021.
//

import UIKit

class MainImagesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Flickr Images"
        
        NetworkService.shared.requestFor(page: 1) { result in
            switch result {
            case .success(let photos):
                print(photos)
            case .failure(let error):
                print(error)
            }
        }
    }

}


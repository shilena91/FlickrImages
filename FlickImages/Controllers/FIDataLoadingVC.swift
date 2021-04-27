//
//  FIDataLoadingVC.swift
//  FlickImages
//
//  Created by Hoang Pham on 27.4.2021.
//

import UIKit

class FIDataLoadingVC: UIViewController {

    private var containerView: UIView?
    private var emptyStateView: FIEmptyStateView?


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView!)
        
        containerView?.backgroundColor = .lightGray
        containerView?.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView?.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView?.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.center(inView: containerView!)
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        containerView?.removeFromSuperview()
        containerView = nil
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        // make sure to never add more than 1 emptyStateView
        if emptyStateView == nil {
            emptyStateView = FIEmptyStateView(message: message)
            emptyStateView?.frame = view.bounds
            view.addSubview(emptyStateView!)
        }
    }

    
    func dismissEmptyStateView() {
        emptyStateView?.removeFromSuperview()
        emptyStateView = nil
    }
}

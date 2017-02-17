//
//  CustomLoadingView.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

open class CustomLoadingView {
    
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    
    open class var shared: CustomLoadingView {
        struct Static {
            static let instance: CustomLoadingView = CustomLoadingView()
        }
        return Static.instance
    }
    
    open func startLoading(_ view: UIView) {
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.3)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        progressView.center = view.center
        progressView.backgroundColor = UIColor(hex: 0xffffff, alpha: 1.0)
        progressView.clipsToBounds = true
        progressView.layer.shadowColor = UIColor.black.cgColor
        progressView.layer.shadowOffset = CGSize.zero
        progressView.layer.shadowOpacity = 1
        progressView.layer.shadowRadius = 10
        progressView.layer.cornerRadius = 10
        
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    open func stopLoading() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
}

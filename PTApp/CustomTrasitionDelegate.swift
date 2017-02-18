//
//  CustomTrasitionDelegate.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class CustomTrasitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var height: CGFloat = 470
    
    override init() {
        super.init()
    }
    
    init(height: CGFloat) {
        super.init()
        self.height = height
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController!, source: UIViewController) -> UIPresentationController? {
        let presentationController = CustomPresentationController(presentedViewController:presented, presenting:presenting, height: height)
        
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = CustomAnimatedTransitioning()
        animationController.isPresentation = true
        return animationController
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = CustomAnimatedTransitioning()
        animationController.isPresentation = false
        return animationController
    }
}

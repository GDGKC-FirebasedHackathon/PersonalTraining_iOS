//
//  PopUpWeightVC.swift
//  PTApp
//
//  Created by Minseo Seo on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class PopUpWeightVC: UIViewController {
    
    @IBOutlet var editWeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPlus(_ sender: UIButton) {
        
        if let vc = presentingViewController?.childViewControllers[0].childViewControllers[0] as? GraphVC {
            vc.testLabel.text = editWeight.text
            vc.dismiss(animated: true, completion: nil)
        }
    }
    
}

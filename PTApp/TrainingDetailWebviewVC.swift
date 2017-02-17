//
//  TrainingDetailWebviewVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class TrainingDetailWebviewVC: UIViewController, UIWebViewDelegate  {
    @IBOutlet weak var MotionWebview: UIWebView!
    var webviewURL : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MotionWebview.delegate = self
        if let url = URL(string: webviewURL!) {
            let request = URLRequest(url: url)
            MotionWebview.loadRequest(request)
        }
    }



}

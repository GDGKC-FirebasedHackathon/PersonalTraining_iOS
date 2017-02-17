//
//  TrainingDetailVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class TrainingDetailVC: UIViewController {
    
    @IBOutlet weak var imgMotion: UIImageView!
    @IBOutlet weak var txtMotionName: UILabel!
    @IBOutlet weak var textMotionDesc: UITextView!
    
    var selectedMotion : MotionVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgMotion.imageFromUrl(selectedMotion?.thumbnail_url, defaultImgPath: "")
     
        txtMotionName.text = selectedMotion?.name
        textMotionDesc.text = selectedMotion?.desc

    }

    @IBAction func btnMotionDetail(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "TrainingDetailWebviewVC") as! TrainingDetailWebviewVC
        
        vc.webviewURL = selectedMotion?.detail_url
        
        navigationController?.pushViewController(vc, animated: true)
    }
 
}

//
//  login_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, NetworkCallback{
    @IBOutlet var editID: UITextField!
    @IBOutlet var editPW: UITextField!
    @IBOutlet var imgLogo: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        imgLogo.expand()
        imgLogo.shake()
        editID.dropDown()
        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(pwdAnimation),userInfo: nil, repeats: false)
    }
    
    func pwdAnimation() {
        editPW.dropDown()
    }
    
    @IBAction func loginBtn(_ sender: AnyObject) {
        let model = LoginModel(self)
        loading(.start)
        model.login(email: editID.text!, pw: editPW.text!)
    }
    
    @IBAction func signupBtn(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController {
            self.present(vc, animated: false)
        }

    }
}

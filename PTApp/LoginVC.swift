//
//  login_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController{
    @IBOutlet var editID: UITextField!
    @IBOutlet var editPW: UITextField!
    
    @IBAction func loginBtn(_ sender: AnyObject) {
        FIRAuth.auth()?.signIn(withEmail: editID.text!, password: editPW.text!, completion: { (user, err) in
            if err == nil{
                print(self.gsno(user?.email))
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbar") as? UITabBarController {
                    self.present(vc, animated: false)
                }
            }
            else{
                self.simpleAlert(title: "로그인 실패", msg: "\(err)")
            }
        })
    }
    
    @IBAction func signupBtn(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

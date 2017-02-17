//
//  login_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase

class login_VC: UIViewController{
    @IBOutlet var id_tf: UITextField!
    @IBOutlet var pw_tf: UITextField!
    
    @IBAction func login_btn(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: id_tf.text!, password: pw_tf.text!, completion: { (user, err) in
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
    
    @IBAction func signup_btn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "signup_VC") as! signup_VC
        navigationController?.pushViewController(vc, animated: true)
    }
}

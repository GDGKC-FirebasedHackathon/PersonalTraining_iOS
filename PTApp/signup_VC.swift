//
//  signup_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase

class signup_VC: UIViewController{
    
    @IBOutlet var name_tf: UITextField!
    @IBOutlet var pn_tf: UITextField!
    @IBOutlet var email_tf: UITextField!
    @IBOutlet var pw_tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUp(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: email_tf.text!, password: pw_tf.text!, completion: { (user, err) in
            if err == nil{
                print(self.gsno(user?.email))
                self.navigationController?.popViewController(animated: true)
            }
            else{
                self.simpleAlert(title: "회원가입 실패", msg:"\(err)")
            }
            
        })
    }
}

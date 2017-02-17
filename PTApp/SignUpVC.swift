//
//  signup_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet var editName: UITextField!
    @IBOutlet var editPhone: UITextField!
    @IBOutlet var editEmail: UITextField!
    @IBOutlet var editPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signUp(_ sender: AnyObject) {
        FIRAuth.auth()?.createUser(withEmail: editEmail.text!, password: editPW.text!, completion: { (user, err) in
            if err == nil{
                print(self.gsno(user?.email))
                let _ = self.navigationController?.popViewController(animated: true)
            }
            else{
                self.simpleAlert(title: "회원가입 실패", msg:"\(err)")
            }
            
        })
    }
}

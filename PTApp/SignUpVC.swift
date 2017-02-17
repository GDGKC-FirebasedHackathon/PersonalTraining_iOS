//
//  signup_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController,NetworkCallback {
    
    @IBOutlet var editName: UITextField!
    @IBOutlet var editPhone: UITextField!
    @IBOutlet var editEmail: UITextField!
    @IBOutlet var editPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signUp(_ sender: AnyObject) {
        let model = SignupModel(self)
        loading(.start)
        model.signup(email: editEmail.text!, pw: editPW.text!)
    }
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
        navigationController?.popViewController(animated: true)
    }
}

//
//  signup_VC.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController,NetworkCallback,RadioButtonControllerDelegate {
    
    var radioButtonController: RadioButtonsController?
    @IBOutlet var editName: UITextField!
    @IBOutlet var editPhone: UITextField!
    @IBOutlet var editEmail: UITextField!
    @IBOutlet var editPW: UITextField!
    var type:Int = 1
    @IBOutlet weak var btn_trainer: RadioButton!
    @IBOutlet weak var btn_customer: RadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        radioButtonController = RadioButtonsController(buttons: btn_trainer,btn_customer)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        didSelectButton(btn_customer)
        self.btn_customer.isChecked = true
    }
    
    @IBAction func signUp(_ sender: AnyObject) {
        let model = SignupModel(self)
        loading(.start)
        model.signup(email: editEmail.text!, pw: editPW.text!,name: editName.text!,type:type,phonenumber:editPhone.text!)
    }
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchPartner") as! SearchPartner
        navigationController?.pushViewController(vc, animated: true)
    }
    func didSelectButton(_ aButton: RadioButton?) {
        if let t:String = aButton?.titleLabel?.text{
            if t == "btn_trainer"{
                type = 0
            }
            else{
                type = 1
            }
        }
    }
}

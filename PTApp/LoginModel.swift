//
//  LoginModel.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import Firebase

class LoginModel: NetworkModel {
    
    func login(email: String, pw: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: pw, completion: { (user, err) in
            if err == nil{
                print(self.gsno(user?.email))
                self.view.networkResult(resultData: "", code: 0)
            }
            else{
                self.view.networkFailed()
            }
        })
    }
    
    
    
}

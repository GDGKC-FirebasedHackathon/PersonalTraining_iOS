//
//  SignupModel.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import Firebase

class SignupModel: NetworkModel {
    
    func signup(email: String, pw: String){
        FIRAuth.auth()?.createUser(withEmail: email, password: pw, completion: { (user, err) in
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

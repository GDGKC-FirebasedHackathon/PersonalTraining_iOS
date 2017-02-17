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
    
    func signup(email: String, pw: String,name:String,type:Int,phonenumber:String){
        FIRAuth.auth()?.createUser(withEmail: email, password: pw, completion: { (user, err) in
            if err == nil{
                print(self.gsno(user?.email))
                var id:String?
                if let user = FIRAuth.auth()?.currentUser {
                    id = user.uid
                }
                print(id!)
                let ref = FIRDatabase.database().reference().child("User").child(id!)
                ref.setValue(["email":email,"name":name,"type":type,"phonenumber":phonenumber])
                self.view.networkResult(resultData: "", code: 0)
            }
            else{
                self.view.networkFailed()
            }
            
        })
    }
    
}

//
//  Searching.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class Searching:UIViewController{
    var mail:String = "" //상대방 메일
    let commentsRef = FIRDatabase.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        loading(.start)
    }
    override func viewWillAppear(_ animated: Bool) {
        loading()
    }
    func loading(){
        var id:String?
        var email:String?
        
        if let user = FIRAuth.auth()?.currentUser {
            id = user.uid
            email = user.email // 내 메일
        }
        
        commentsRef.child("User").observe(.value, with: { (snapshot) in
            if let value = snapshot.value{
                let datas = JSON(value)
                
                if datas[self.mail]["partner_id"].string == email!{
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }
        })
        commentsRef.child("User").setValue(["partner_id":mail])
    }
}

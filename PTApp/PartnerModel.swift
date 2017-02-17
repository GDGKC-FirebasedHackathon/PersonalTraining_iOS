//
//  PartnerModel.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import Firebase

class PartnerModel:NetworkModel{
    
    func search_partner(partner_id:String){
        var id:String?
        if let user = FIRAuth.auth()?.currentUser {
            id = user.uid
        }
        let ref = FIRDatabase.database().reference().child("User").child(id!)
        ref.setValue(["partner_id":partner_id])
        self.view.networkResult(resultData: "", code: 0)
        
    }
}

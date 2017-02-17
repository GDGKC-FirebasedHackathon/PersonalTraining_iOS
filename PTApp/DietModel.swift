//
//  DietModel.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import Firebase

class DietModel: NetworkModel {
    
    func getDietList(uid: String) {
        let ref = FIRDatabase.database().reference().child("Diet").child(uid)
        ref.queryOrderedByKey().observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot.value)
        })
    }
    
}

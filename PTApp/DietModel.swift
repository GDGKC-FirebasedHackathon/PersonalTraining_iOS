//
//  DietModel.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

class DietModel: NetworkModel {
    
    let baseRef = FIRDatabase.database().reference()
    
    func getDietList(uid: String) {
        let ref = baseRef.child("Diet").child(uid)
        
        ref.observe(.value, with: { snapshot in
            if let value = snapshot.value {
                let data = JSON(value)
                var dvoList = [DietVO]()
                if let dic = data.dictionary {
                    for item in dic {
                        if let mvoDic = item.value.dictionary {
                            for mvoItem in mvoDic {
                                let dvo = DietVO(date: item.key.toDate(format: nil), thumbnail: mvoItem.value["photo_url"].string)
                                dvoList.append(dvo)
                                //let mvo = MealVO(meal_id: item.key, type: item.value["type"].string, photo_url: item.value["photo_url"].string)
                                break
                            }
                        }
                    }
                    self.view.networkResult(resultData: dvoList, code: 0)
                }
            }
        })
        
        //        ref.queryOrderedByKey().observeSingleEvent(of: .value, with: { (snapshot) in
        //            if let value = snapshot.value {
        //                print(value)
        //                let data = JSON(value)
        //                var dvoList = [DietVO]()
        //
        //                if let array = data.array {
        //                    for item in array {
        //                        //let dvo = DietVO(date: item[""], meals: <#T##[MealVO]#>, trainer_id: <#T##String?#>, customer_id: <#T##String?#>)
        //                    }
        //                }
        //                self.view.networkResult(resultData: "", code: 0)
        //            }
        //        })
    }
    
    //    func getDietByDate(date: Date) {
    //        let ref = baseRef.child("Diet").child()
    //    }
    
}

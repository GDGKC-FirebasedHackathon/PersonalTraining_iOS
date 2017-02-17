//
//  MealModel.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import FirebaseStorage
import Firebase


class MealModel:NetworkModel{
    
    
    func add_meal(id:String,date:Date,meal:MealVO, imgData: Data){
        var strURL: String?
        let storage = FIRStorage.storage()
        let storageRef = storage.reference()
        let mealImagesRef = storageRef.child("images/meal.jpg")
        print(imgData)
        let uploadTask = mealImagesRef.put(imgData, metadata: nil) { metadata, error in
            if (error != nil) {
                self.view.networkFailed()
            } else {
                let downloadURL = metadata!.downloadURL()
                strURL = downloadURL?.absoluteString
                
                let ref = FIRDatabase.database().reference().child("Diet").child(id).child(date.toString(format:"yyyyMd")).childByAutoId()
                ref.setValue(["type":self.gino(meal.type),"comment":meal.comment,"photo_url":self.gsno(strURL)])
                self.view.networkResult(resultData: "", code: 0)
            }
        }
    }
}

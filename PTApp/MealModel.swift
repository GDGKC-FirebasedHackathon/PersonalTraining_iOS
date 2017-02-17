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
import SwiftyJSON


class MealModel:NetworkModel{
    
    let baseRef = FIRDatabase.database().reference().child("Diet")
    
    func add_meal(id:String,date:Date,meal:MealVO, imgData: Data){
        var strURL: String?
        let storage = FIRStorage.storage()
        let storageRef = storage.reference()
        let mealImagesRef = storageRef.child("images/\(date.toString(format: "yyyy-MM-dd"))\(gino(meal.type)).jpg")
        print(imgData)
        let uploadTask = mealImagesRef.put(imgData, metadata: nil) { metadata, error in
            if (error != nil) {
                self.view.networkFailed()
            } else {
                let downloadURL = metadata!.downloadURL()
                strURL = downloadURL?.absoluteString
                let tempDate = Calendar(identifier: .gregorian).date(byAdding: Calendar.Component.day, value: -3, to: date)!
                let strDate = tempDate.toString(format:"yyyy-MM-dd")
                let dietRef = self.baseRef.child(id).child(strDate)
                dietRef.setValue(["date": strDate])
                let ref = self.baseRef.child(id).child(strDate).childByAutoId()
                ref.setValue(["type":self.gino(meal.type),"comment":meal.comment,"photo_url":self.gsno(strURL)])
                
                self.view.networkResult(resultData: "", code: 0)
            }
        }
    }
    
    func getMealList(id: String, date: Date) {
        print(date.toString(format: nil))
        let ref = self.baseRef.child(id).child(date.toString(format: "yyyy-MM-dd"))
        ref.observe(.value, with: { snapshot in
            if let value = snapshot.value {
                let data = JSON(value)
                var mvoList = [MealVO]()
                for dicItem in data.dictionaryValue {
                    if dicItem.key != "date" {
                        let mvo = MealVO()
                        mvo.type = dicItem.value["type"].int
                        mvo.photo_url = dicItem.value["photo_url"].string
                        mvo.meal_id = dicItem.key
                        mvoList.append(mvo)
                    }
                }
                self.view.networkResult(resultData: mvoList, code: 0)
            }
        
        })
    }
}

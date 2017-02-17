//
//  MealModel.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation
import Firebase

class MealModel:NetworkModel{
    
    
    func add_meal(id:String,date:Date,meal:MealVO){
        let ref = FIRDatabase.database().reference().child("Diet").child(id).child(date.toString(format:"yyyy'/'M'/'d'")).child("\(meal.meal_id)")
        ref.setValue(["name":meal.type,"comment":meal.comment,"photo_url":meal.photo_url])
    }
}

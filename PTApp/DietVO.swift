//
//  Diet.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//
import Foundation
class DietVO{
    
    init(date:Date?, thumbnail:String?){
        self.date = date
        self.thumbnail = thumbnail
    }
    
    init(id:String?, date:Date?,meals:[MealVO],trainer_id:String?,customer_id:String?){
        self.id = id
        self.date = date
        self.meals = meals
        self.trainer_id = trainer_id
        self.customer_id = customer_id
    }
    
    init(date:Date?,meals:[MealVO],trainer_id:String?,customer_id:String?){
        self.date = date
        self.meals = meals
        self.trainer_id = trainer_id
        self.customer_id = customer_id
    }
    
    var id:String?
    var date:Date?
    var thumbnail:String?
    var meals = [MealVO]()
    var trainer_id:String?
    var customer_id:String?
}

//
//  HomeworkVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//
import Foundation

class HomeworkVO{
    
    init(id:Int?,date:Date?,trainer_id:String?,customer_id:String?,motions:[MotionVO]){
        self.id = id
        self.date = date
        self.motions = motions
        self.trainer_id = trainer_id
        self.customer_id = customer_id
    }
    
    var id:Int?
    var date:Date?
    var motions:[MotionVO]
    var trainer_id:String?
    var customer_id:String?
}

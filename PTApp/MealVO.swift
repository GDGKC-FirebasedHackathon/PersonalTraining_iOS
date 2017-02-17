//
//  MealVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation

class MealVO{
    
    init() {
        
    }
    
    init(meal_id: String?, type: Int?, photo_url: String?) {
        self.meal_id = meal_id
        self.type = type
        self.photo_url = photo_url
    }
    
    init(meal_id:String?,type:Int?,photo_url:String?,comment:[CommentVO]){
        self.meal_id = meal_id
        self.type = type
        self.photo_url = photo_url
        self.comment = comment
    }
    
    init(type:Int?,photo_url:String?,comment:[CommentVO]){
        self.type = type
        self.photo_url = photo_url
        self.comment = comment
    }
    
    var meal_id:String?
    var type:Int?
    var photo_url:String?
    var comment = [CommentVO]()
}

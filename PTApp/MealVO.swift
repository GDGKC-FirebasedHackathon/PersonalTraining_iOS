//
//  MealVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation

class MealVO{
    
    init(meal_id:Int?,type:Int?,photo_url:String?,comment:[CommentVO]){
        self.meal_id = meal_id
        self.type = type
        self.photo_url = photo_url
        self.comment = comment
    }
    
    var meal_id:Int?
    var type:Int?
    var photo_url:String?
    var comment: [CommentVO]
}

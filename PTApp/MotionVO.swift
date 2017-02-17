//
//  MotionVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

class MotionVO{
    
    init(id:String?,name:String?,desc:String?,thumbnail_url:String?,detail_url:String?,done:Int?){
        self.id = id
        self.name = name
        self.desc = desc
        self.thumbnail_url = thumbnail_url
        self.detail_url = detail_url
        self.done = done
    }
    
    var id:String?
    var name:String?
    var desc:String?
    var thumbnail_url:String?
    var detail_url:String?
    var done:Int?
}

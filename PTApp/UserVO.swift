//
//  UserVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

class UserVO {
    
    init(id:String?,pw:String?,name:String?,type:Int?,partner_id:String?){
        self.id = id
        self.pw = pw
        self.name = name
        self.type = type
        self.partner_id = partner_id
        
    }
    
    var id:String?
    var pw:String?
    var name:String?
    var type:Int?
    var partner_id:String?
    
}

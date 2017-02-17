//
//  CommentVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation

class CommentVO{
    
    init(id:Int?, writer_id:String?,time:Date?,content:String?){
        self.id = id
        self.writer_id = writer_id
        self.time = time
        self.content = content
    }
    
    var id:Int?
    var writer_id:String?
    var time:Date?
    var content:String?
}

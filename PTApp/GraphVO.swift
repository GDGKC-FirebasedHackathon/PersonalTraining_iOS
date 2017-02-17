//
//  GraphVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation

class GraphVO{
    init(weight:Float?,date:Date?){
        self.date = date
        self.weight = weight
    }
    var weight:Float?
    var date:Date?
    
}

//
//  CustomerVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

class CustomerVO:UserVO{
    init(id: String?, pw: String?, name: String?, type: Int?, partner_id: String?, weight: Float?) {
        super.init(id: id, pw: pw, name: name, type: type, partner_id: partner_id)
        self.weight = weight
    }
    var weight:Float?
}

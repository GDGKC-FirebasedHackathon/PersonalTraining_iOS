//
//  MotionVO.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

class MotionVO{
    
    init(id:String?){
        self.id = id
        self.name = "런지 [Lunge]"
        self.desc = "대표적인 다리 운동 중 하나로 허벅지와 엉덩이에 탄력을 주며 하체 근력을 강화하는 운동이다. 자신의 체중을 이용해 실시하더라도 충분한 자극을 느낄 수 있지만, 더 강한 운동 효과를 원한다면 덤벨이나 바벨을 이용하여 천천히 운동하는 것이 좋다."
        self.thumbnail_url = "https://firebasestorage.googleapis.com/v0/b/ptapp-c4db5.appspot.com/o/Lunge.jpg?alt=media&token=3eb47b24-0b24-4809-8b25-65966eeb18f8"
        self.detail_url = "http://terms.naver.com/entry.nhn?docId=2099784&cid=51030&categoryId=51030"
       
    }
    
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

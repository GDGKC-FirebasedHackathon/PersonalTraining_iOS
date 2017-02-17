//
//  NetworkModel.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import Foundation

class NetworkModel {
    
    var view: NetworkCallback
    
    init(_ view: NetworkCallback) {
        self.view = view
    }
    
    
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    internal func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    internal func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
    //옵셔널 Float를 해제하는데 값이 nil이면 0을 반환
    internal func gfno(_ data: Float?) -> Float {
        guard let num = data else {
            return 0
        }
        return num
    }
}

//
//  NetworkCallback.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

protocol NetworkCallback {
    func networkResult(resultData: Any, code: Int)
    func networkFailed()
}

//
//  CommentView.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class CommentView: UIView {
    
    init(width: CGFloat,y: CGFloat, name: String, desc: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        initCommentView(name: name, desc: desc, y: y)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var txtName = UILabel()
    var txtDesc = UILabel()
    
    private func initCommentView(name: String, desc: String, y: CGFloat) {
        txtName.frame = CGRect(x: 8, y: 8, width: 0, height: 0)
        txtDesc.frame = CGRect(x: 8, y: 25, width: self.frame.width - 16, height: 0)
        txtName.text = name
        txtDesc.text = desc
        txtName.sizeToFit()
        txtDesc.sizeToFit()
        self.addSubview(txtName)
        self.addSubview(txtDesc)
        self.frame = CGRect(x: 0, y: y, width: self.frame.width, height: 18 + txtName.frame.height + txtDesc.frame.height)
    }
}

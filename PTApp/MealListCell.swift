//
//  MealListCell.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class MealListCell: UITableViewCell {
    @IBOutlet var txtMealType: UILabel!
    @IBOutlet var imgMeal: UIImageView!
    @IBOutlet var stackComment: UIStackView!
    @IBOutlet var editComment: UITextField!
    @IBOutlet var btnPost: UILabel!
    
    func setMealType(type: Int) {
        var strType = ""
        switch type {
        case MealType.breakfast.rawValue:
            strType = "아침"
        case MealType.lunch.rawValue:
            strType = "점심"
        case MealType.dinner.rawValue:
            strType = "저녁"
        default:
            strType = "간식"
        }
        txtMealType.text = strType
    }

}

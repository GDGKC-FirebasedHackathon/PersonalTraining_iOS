//
//  SecondMain_DetailVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

enum MealType: Int {
    case breakfast = 0
    case lunch = 1
    case dinner = 2
    case snack = 3
}

class DietDetailVC: UITableViewController, NetworkCallback {
    
    var dietDate = Date()
    var mealList = [MealVO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = dietDate.toString(format: nil)
        let model = MealModel(self)
        loading(.start)
        model.getMealList(id: userID, date: dietDate)
        
    }
    
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
        let data = resultData as! [MealVO]
        mealList = data
        tableView.reloadData()
    }
    
}

extension DietDetailVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealListCell") as! MealListCell
        cell.imgMeal.imageFromUrl(meal.photo_url, defaultImgPath: "")
        cell.setMealType(type: gino(meal.type))
        if indexPath.row == 0 {
            for i in 0..<3 {
                let y = i == 0 ? 0 : cell.stackComment.frame.height
                let commentView = CommentView(width: cell.stackComment.frame.width, y: y, name: "이경욱", desc: "마시멜로 초콜릿 퐁듀를 먹어버렸어요...")
                cell.stackComment.addArrangedSubview(commentView)
                var height: CGFloat = 0
                for item in cell.stackComment.arrangedSubviews {
                    height += (item.frame.height + 5)
                }
                cell.stackComment.axis = .vertical
                print(cell.stackComment.frame)
                cell.stackComment.frame.size = CGSize(width: cell.stackComment.frame.width, height: height)
                print(cell.stackComment.frame)
                cell.stackComment.reloadInputViews()
            }
        }
        
        return cell
    }
}

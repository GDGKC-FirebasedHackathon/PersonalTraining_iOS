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

class DietDetailVC: UITableViewController {
    
    var dietID = ""
    var mealList = [MealVO]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let meal = mealList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealListCell") as! MealListCell
        
//        cell.imgMeal.imageFromUrl(meal.photo_url, defaultImgPath: "")
//        cell.setMealType(type: gino(meal.type))
        
        for i in 0..<3 {
            let y = i == 0 ? 0 : cell.stackComment.frame.height
            let commentView = CommentView(width: cell.stackComment.frame.width, y: y, name: "품파", desc: "가가가가가")
            //cell.contentView.addSubview(commentView)
            cell.stackComment.addArrangedSubview(commentView)
        }
        print(cell.stackComment.arrangedSubviews)
        
        return cell
    }
    
    func sls() {
        
    }
  
}

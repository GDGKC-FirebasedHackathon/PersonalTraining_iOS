//
//  SecondMain_DetailVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class DietDetailVC: UITableViewController {
    
    var dietID = 0
    var mealList = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = mealList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealListCell") as! MealListCell
        
        return cell
    }
  
}

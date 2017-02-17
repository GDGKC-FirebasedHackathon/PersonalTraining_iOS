//
//  SecondMain_ListVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class DietListVC : UIViewController, UITableViewDelegate {
    
    var dietList = [DietVO]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dietList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let diet = dietList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DietListCell") as! DietListCell
        cell.txtDate.text = diet.date?.toString(format: nil)
        cell.imgDiet.imageFromUrl(diet.meals.last?.photo_url, defaultImgPath: "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let diet = dietList[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DietDetailVC") as! DietDetailVC
        vc.dietID = gsno(diet.id)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

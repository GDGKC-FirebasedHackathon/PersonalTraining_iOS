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
    
    override func viewDidLoad() {
//        let mvo = MealVO(meal_id: 0, type: MealType.breakfast.rawValue, photo_url: "", comment: [CommentVO]())
//        let dvo = DietVO(id: "qq@qq.com", date: Date(), meals: <#T##[MealVO]#>, trainer_id: <#T##String?#>, customer_id: <#T##String?#>)
//        dietList.append(<#T##newElement: Element##Element#>)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
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
    @IBAction func postMeal(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MealPostVC") as! MealPostVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

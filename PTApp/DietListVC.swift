//
//  SecondMain_ListVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class DietListVC : UIViewController, NetworkCallback {
    
    var dietList = [DietVO]()
    
    override func viewDidLoad() {
        print("@@@@@@@@@", partnerID)
        let model = DietModel(self)
        loading(.start)
        model.getDietList(uid: userID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func postMeal(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MealPostVC") as! MealPostVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
    }
}

extension DietListVC: UITableViewDelegate, UITableViewDataSource {
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

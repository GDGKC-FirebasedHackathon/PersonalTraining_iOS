//
//  SecondMain_ListVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class DietListVC : UIViewController, NetworkCallback {
    
    @IBOutlet var tableView: UITableView!
    
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
    
    @IBAction func postMeal(_ sender: AnyObject) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MealPostVC") as! MealPostVC
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
        dietList = resultData as! [DietVO]
        tableView.reloadData()
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
        cell.imgDiet.imageFromUrl(diet.thumbnail, defaultImgPath: "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let diet = dietList[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DietDetailVC") as! DietDetailVC
        vc.dietDate = diet.date!
        tabBarController?.tabBar.isHidden = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

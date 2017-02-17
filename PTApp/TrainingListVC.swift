//
//  TrainingListVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class TrainingListVC: UICollectionViewController {

    var Array = [String]()
    var ButtonArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Array = ["a","b","c","d"]
        ButtonArray = ["a","b","c","d"]
        
         }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "motionCell", for: indexPath) as UICollectionViewCell
        
        var Label = cell.viewWithTag(1) as! UILabel
        
        Label.text = Array[indexPath.row]
      
        var Button = cell.viewWithTag(2) as! UIButton
        
        Button.setTitle(ButtonArray[indexPath.row], for: UIControlState.normal)
        
        return cell
    }
}

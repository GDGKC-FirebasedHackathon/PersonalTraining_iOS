//
//  TrainingListVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class TrainingListVC: UICollectionViewController {

    var motionArray = [MotionVO]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
         }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return motionArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "motionCell", for: indexPath) as UICollectionViewCell
        
        var motionNameLabel = cell.viewWithTag(1) as! UILabel
        motionNameLabel.text = motionArray[indexPath.row].name
        
        var motionImgView = cell.viewWithTag(2) as! UIImageView
        motionImgView.imageFromUrl(motionArray[indexPath.row].thumbnail_url, defaultImgPath: "")
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        let vc = storyboard?.instantiateViewController(withIdentifier: "TrainingDetailVC") as! TrainingDetailVC
        
        //vc.dietID = diet.id
        navigationController?.pushViewController(vc, animated: true)
    }
}

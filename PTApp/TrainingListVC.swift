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
    var selectedArray = NSMutableArray()
    
    let selectedImage = UIImage(named: "selected")
    let unselecedImage  = UIImage(named: "unselected")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        motionArray.append(MotionVO(id: "1"))
        motionArray.append(MotionVO(id: "2"))
        motionArray.append(MotionVO(id: "3"))
        motionArray.append(MotionVO(id: "4"))
        motionArray.append(MotionVO(id: "5"))
        motionArray.append(MotionVO(id: "6"))
        motionArray.append(MotionVO(id: "7"))
        motionArray.append(MotionVO(id: "8"))
        motionArray.append(MotionVO(id: "9"))
        motionArray.append(MotionVO(id: "10"))
         }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return motionArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "motionCell", for: indexPath) as UICollectionViewCell
        
        let motionNameLabel = cell.viewWithTag(1) as! UILabel
        motionNameLabel.text = motionArray[indexPath.row].name
        
        let motionImgView = cell.viewWithTag(2) as! UIImageView
        motionImgView.imageFromUrl(motionArray[indexPath.row].thumbnail_url, defaultImgPath: "")
        
        let motionCheckBox = cell.viewWithTag(3) as! CustomCheckBox
        motionCheckBox.temp = gino(Int(gsno(motionArray[indexPath.row].id)))
        motionCheckBox.addTarget(self, action: #selector(TrainingListVC.tickClicked(sender:)), for: .touchUpInside)
        
        if selectedArray.contains(gino(Int(gsno(motionArray[indexPath.row].id)))){
            motionCheckBox.setBackgroundImage(selectedImage, for: UIControlState.normal)
        }else{
            motionCheckBox.setBackgroundImage(unselecedImage, for: UIControlState.normal)
        }
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
        let vc = storyboard?.instantiateViewController(withIdentifier: "TrainingDetailVC") as! TrainingDetailVC
        vc.selectedMotion = motionArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tickClicked(sender: CustomCheckBox!){
        let value = sender.temp
        if selectedArray.contains(gino(value)){
            selectedArray.remove(gino(value))
        }else{
            selectedArray.add(gino(value))
        }
        
        collectionView?.reloadData()
        
    }
}

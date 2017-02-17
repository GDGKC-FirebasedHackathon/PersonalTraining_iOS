//
//  TrainingListVC.swift
//  PTApp
//
//  Created by YuJungin on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class TrainingListVC: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    var userInfo = UserVO()
    var motionArray = [MotionVO]()
    var checkBoxArray = [CustomCheckBox]()
    var selectedArray = NSMutableArray()
    var selectable : Bool?
    var dbRef : FIRDatabaseReference!
    
    let selectedImage = UIImage(named: "selected")
    let unselecedImage  = UIImage(named: "unselected")
    
    @IBOutlet weak var btnSelectMotion: UIBarButtonItem!
    @IBAction func btnSelect(_ sender: Any) {
        if(selectable == false){ // 선택버튼 누르면
            for checkbox in checkBoxArray{
                checkbox.isHidden = false
            }
            self.btnSelectMotion.title = "전송"
            selectable = true
        }
        else if(selectable == true){ //전송버튼 누르면
            for checkbox in checkBoxArray{
                checkbox.setBackgroundImage(unselecedImage, for: UIControlState.normal)
                checkbox.isHidden = true
            }
            let customTransitionDelegate = CustomTrasitionDelegate(height: 420)
            transitioningDelegate = customTransitionDelegate
            
            if(userInfo.type == 0){
                // 트레이너인 경우
                simpleAlert(title: "전송 완료", msg: "고객에게 오늘의 동작이 전송되었습니다.")
                
            }
            else if(userInfo.type == 1){
                // 고객인 경우
                simpleAlert(title: "전송 완료", msg: "트레이너에게 완료된 동작이 전송되었습니다.")
                
            }
            selectedArray.removeAllObjects()
            self.btnSelectMotion.title = "선택"
            selectable = false
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading(.start)
        selectable  = false
        userInfo.type = 0
        
        dbRef = FIRDatabase.database().reference()

        _ = dbRef.observe(.value,with: {
            snapshot in
            if let value = snapshot.value {
                let data = JSON(value)
                let array = data["Motions"].arrayValue
                var tempList = [MotionVO]()
                for item in array {
                    let mvo = MotionVO(id: item["id"].string,
                                       name: item["name"].string,
                                       desc: item["desc"].string,
                                       thumbnail_url: item["thumbnail_url"].string,
                                       detail_url: item["detail_url"].string,
                                       done: item["done"].int)
                    tempList.append(mvo)
                }
                  self.motionArray = tempList
                
            }
      self.collectionView?.reloadData()
        })
        
       
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
        
        checkBoxArray.append(motionCheckBox)
        
        if(selectable == false){
            motionCheckBox.isHidden = true
        }
        else if(selectable == true){
            motionCheckBox.isHidden = false
        }
        
        if selectedArray.contains(gino(Int(gsno(motionArray[indexPath.row].id)))){
            motionCheckBox.setBackgroundImage(selectedImage, for: UIControlState.normal)
        }else{
            motionCheckBox.setBackgroundImage(unselecedImage, for: UIControlState.normal)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/2-5, height: collectionView.bounds.size.width/2-5)
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

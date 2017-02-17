//
//  MealPostVC.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class MealPostVC: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var nullView: CustomView!
    @IBOutlet var imgMeal: UIImageView!
    @IBOutlet var btnPost: UIButton!
    
    let rbController = RadioButtonsController()
    
    override func viewDidLoad() {
        for view in stackView.arrangedSubviews {
            rbController.addButton((view as! RadioButton))
        }
        rbController.selectRadioBtn(index: 3)
    }
    
    @IBAction func selectPic(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func postMeal(_ sender: Any) {
        
    }
    
}

extension MealPostVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //사진 선택 안하고 종료 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //사진 선택 관련 컨트롤러
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        imgMeal.image = newImage
        btnPost.backgroundColor = UIColor(hex: 0x00B0F0, alpha: 1)
        btnPost.isEnabled = true
        
        dismiss(animated: true, completion: nil)
    }
}

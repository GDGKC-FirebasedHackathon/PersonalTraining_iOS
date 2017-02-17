//
//  MealPostVC.swift
//  PTApp
//
//  Created by  noldam on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class MealPostVC: UIViewController, NetworkCallback {
    
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
        let photo = UIImageJPEGRepresentation(imgMeal.image!, 0.6)!
        let mvo = MealVO(type: rbController.selectedRow, photo_url: nil, comment: [CommentVO]())
        
        let model = MealModel(self)
        loading(.start)
        model.add_meal(id: "7igkgQtjVjRyFUPiWKzeqUWRhw22", date: Date(), meal: mvo, imgData: photo)
    }
    
    func networkResult(resultData: Any, code: Int) {
        loading(.end)
        let alert = UIAlertController(title: "식단 업로드", message: "업로드 완료되었습니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) {_ in
            let _ = self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true)
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

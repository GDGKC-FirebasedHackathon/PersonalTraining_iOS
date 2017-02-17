//
//  ExtentionControl.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 17..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase

extension UIViewController{
    
    var userID: String {
        if let user = FIRAuth.auth()?.currentUser {
            return user.uid
        } else {
            return ""
        }
    }
    
    var partnerID: String {
        return gsno(UserDefaults.standard.string(forKey: "partnerID"))
    }
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func gsno(_ value: String?) -> String {
        if let value_ = value {
            return value_
        } else {
            return ""
        }
    }
    
    func gino(_ value: Int?) -> Int {
        if let value_ = value {
            return value_
        } else {
            return 0
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func loading(_ state: LoadingState) {
        if state == .start {
            CustomLoadingView.shared.startLoading(view)
        } else {
            CustomLoadingView.shared.stopLoading()
        }
    }
    
    enum LoadingState {
        case start
        case end
    }
    
    //네트워크 연결 에러 시
    func networkFailed() {
        loading(.end)
        simpleAlert(title: "네트워크 에러", msg: "인터넷 연결을 확인해주세요.")
    }
}

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension Date {
    func toString(format: String?) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-kr")
        let strFormat = format == nil ? "yyyy년 MM월 dd일" : format
        formatter.dateFormat = strFormat
        
        return formatter.string(from: self)
    }
}

extension UIImageView {
    
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
            }
        } else {
            self.image = defaultImg
        }
    }
}

extension String {
    
    func toDate(format: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-kr")
        let strFormat = format == nil ? "yyyy-MM-dd" : format
        formatter.dateFormat = strFormat
        
        return formatter.date(from: self)
    }
}

extension UIView {
    
    func expand() {
        self.transform = self.transform.scaledBy(x: 0.25, y: 0.25)
        
        UIView.animate(withDuration: 1.2,
                       delay: 0.0,
                       usingSpringWithDamping: 1.5,
                       initialSpringVelocity: 0.1,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: ({
                        self.transform = self.transform.scaledBy(x: 4.0, y: 4.0)
                       }),
                       completion: nil)
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.4
        animation.values = [-15.0, 15.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func dropDown() {
        let fallDown1 = CABasicAnimation(keyPath: "transform.translation.y")
        fallDown1.duration = 0.3
        fallDown1.fromValue = -20
        fallDown1.toValue = 10
        
        let goUp = CABasicAnimation(keyPath: "transform.translation.y")
        goUp.duration = 0.3
        goUp.fromValue = 10
        goUp.toValue = -3
        goUp.beginTime = fallDown1.beginTime + fallDown1.duration
        
        let fallDown2 = CABasicAnimation(keyPath: "transform.translation.y")
        fallDown2.duration = 0.3
        fallDown2.fromValue = -3
        fallDown2.toValue = 0
        fallDown2.beginTime = goUp.beginTime + goUp.duration
        
        let dropDownAnimationGroup = CAAnimationGroup()
        dropDownAnimationGroup.animations = [fallDown1, goUp, fallDown2]
        dropDownAnimationGroup.duration = fallDown2.beginTime + fallDown2.duration
        layer.add(dropDownAnimationGroup, forKey: nil)
    }
}


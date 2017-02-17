//
//  SearchPartner.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class SearchPartner:UIViewController{
    let commentsRef = FIRDatabase.database().reference()
    @IBOutlet var editEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirm(_ sender: Any) {
        
//        var id:String?
//        if let user = FIRAuth.auth()?.currentUser {
//            id = user.uid
//        }
        
        commentsRef.child("User").observe(.value, with: { (snapshot) -> Void in
            let value = snapshot.value as! Dictionary<String,String>
            print(value)
        })
        commentsRef.child("User").observe(.value, with: { (snapshot) in
            if let value = snapshot.value{
                let data = JSON(value)
                print(data.arrayObject)
            }
        })
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "Searching") as! Searching
//        navigationController?.pushViewController(vc, animated: false)
    }
    
    
}

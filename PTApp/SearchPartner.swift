//
//  SearchPartner.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class SearchPartner:UIViewController{
    
    @IBOutlet var editEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirm(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Searching") as! Searching
        vc.mail = editEmail.text!
        navigationController?.pushViewController(vc, animated: false)
        
        
        
        
    }
    
    
}

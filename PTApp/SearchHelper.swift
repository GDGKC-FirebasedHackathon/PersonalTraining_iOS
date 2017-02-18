//
//  SearchHelper.swift
//  PTApp
//
//  Created by OhKanghoon on 2017. 2. 18..
//  Copyright © 2017년 GDGKC-FirebasedHackathon. All rights reserved.
//

import UIKit

class SearchHelper:UIViewController{
    
    @IBOutlet var editEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func act(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Searchings") as! Searchings
        vc.mail = editEmail.text!
        navigationController?.pushViewController(vc, animated: false)
    }
    

    
}

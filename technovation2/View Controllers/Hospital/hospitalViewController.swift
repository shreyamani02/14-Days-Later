//
//  hospitalViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/19/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class hospitalViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
           Utilities.styleFilledButton(signUpButton)
           Utilities.styleHollowButton(loginButton)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

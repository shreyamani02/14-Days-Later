//
//  hospitalHomeViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/19/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class hospitalHomeViewController: UIViewController {
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var patientLogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        Utilities.styleFilledButton(mapButton)
        Utilities.styleHollowButton(settingsButton)
        Utilities.styleFilledButton(patientLogButton)
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

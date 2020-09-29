//
//  HomeViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/8/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var factsButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var supportBusinessButton: UIButton!
    @IBOutlet weak var generalInformation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        Utilities.styleFilledButton(mapButton)
        Utilities.styleHollowButton(factsButton)
        Utilities.styleFilledButton(supportBusinessButton)
        Utilities.styleHollowButton(generalInformation)
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

//
//  covid19ViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 5/1/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class covid19ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func phoneHotLine(_ sender: Any) {
        if let url = URL(string: "tel://\(8334224255)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
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

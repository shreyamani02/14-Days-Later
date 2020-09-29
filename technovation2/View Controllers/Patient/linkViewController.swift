//
//  linkViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 5/1/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class linkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func genInf(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://youtu.be/9cfYC4YLsu4")! as URL)
    }
    
    @IBAction func avoid19(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://youtu.be/9Ay4u7OYOhA")! as URL)
    }
    
    @IBAction func symptoms2019(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://youtu.be/LBHPUegGIpA")! as URL)
    }
    
    @IBAction func home19(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "https://youtu.be/qPoptbtBjkg")! as URL)
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

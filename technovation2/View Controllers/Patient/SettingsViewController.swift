//
//  ConservationViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/12/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var Email: UILabel!
    
    @IBOutlet weak var conservationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        //conservationLabel.text = "First Name:"
        firstName.text  = globalFirstName
        lastName.text = globalLastName
        Email.text = globalEmail
        
    }
    

    @IBAction func navigateHomeButton(_ sender: Any) {
        /*let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! HomeViewController
        self.present(nextViewController, animated:true, completion:nil)*/
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

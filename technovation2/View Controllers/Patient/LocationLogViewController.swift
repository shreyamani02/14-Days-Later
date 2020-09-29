//
//  BusinessViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/16/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//
var globalUser = ""
var globalCOVID = false
var numLocations = 0

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LocationLogViewController: UIViewController {

    @IBOutlet weak var contractedCovid: UISwitch!
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var locationLog: UILabel!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var addLocation: UIButton!
    @IBOutlet weak var longitude2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FirstView"
        if (globalCOVID){
            contractedCovid.isOn = true
        }
        else {
            contractedCovid.isOn = false
        }

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addLocation(_ sender: UIButton) {
         numLocations += 1
               switch numLocations {
                   case let numLocations as Int:
                       let currLocation = "\(numLocations)"
                       print(currLocation)
               default:
                       print("didn't work")
               }
               
               var ref: DatabaseReference!
               ref = Database.database().reference(fromURL: "https://technovation2-aaa36.firebaseio.com/")
                   if (latitude.text != "" && longitude2.text != "" && userName.text != "") {
                       ref?.child("Locations").child(userName.text ?? "Location").setValue(["Lang": latitude.text, "Long": longitude2.text])
                              globalUser = userName.text ?? ""
                       
                       if (globalCOVID){
                           var ref2: DatabaseReference!
                           ref2 = Database.database().reference(fromURL: "https://technovation2-aaa36.firebaseio.com/")
                           ref2?.child("Locations").child(globalUser).child("COVID?").setValue([true])
                       }
        }
            
           // ref.child(userName.text + "/lang").setValue(self.lang.text)
                // ref.child(userName.text  "/long").setValue(self.long.text)
            /*Auth.auth().createUser(withEmail: lang.text!, password: long.text!) { (result, err) in
                    let db = Firestore.firestore()
                db.collection("locations").addDocument(data: ["lang":self.lang.text, "long":self.long.text, "uid": result!.user.uid]) {(error)in }
                }
            */
            
    }
    @IBAction func switchPressed(_ sender: UISwitch) {
        globalCOVID = true
            var ref2: DatabaseReference!
            ref2 = Database.database().reference(fromURL: "https://technovation2-aaa36.firebaseio.com/")
        ref2?.child("Locations").child(globalUser).child("COVID?").setValue([true])

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

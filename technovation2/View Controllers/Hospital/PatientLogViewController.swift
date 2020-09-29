//
//  PatientLogViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/25/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseDatabase


class PatientLogViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var names: UILabel!
    
    private var x: CollectionReference!
    var idArrays = [String]()
    var firstArray = [String]()
    var patientList = "The patients you entered are as follows: "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x = Firestore.firestore().collection("users")
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        Utilities.styleFilledButton(submitButton)
        Utilities.styleTextField(id)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        x.getDocuments { (snapshot, error) in
            if let err = error{
                //print(snapshot?.documents)
                print("hello world")
        }
            else{
                for document in (snapshot?.documents)!{
                    let data = document.data()
                    let identification = data["id"] as? String ?? ""
                    let firstname = data["firstname"] as? String ?? ""
                    print(document.data())
                    self.idArrays.append(identification)
                    self.firstArray.append(firstname)
                }
                for i in self.idArrays{
                    print(i)
                }
            }
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
    @IBAction func submitTapped(_ sender: Any) {
        let enteredID = id.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        for k in 0...idArrays.count - 1{
            if (enteredID == idArrays[k]){
                patientList += firstArray[k] + ", "
            }
        }
        patientList += ". If you wish to change any personal information, please email fourteendayslater@gmail.com. If you wish to add a public location visited, please log in and add it through the hospital's account, emailing us afterwards."
        names.text = patientList
        names.alpha = 1
        
    }
    
}

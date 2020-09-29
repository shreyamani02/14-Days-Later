//
//  hospitalSignupViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/19/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class hospitalSignupViewController: UIViewController {

    @IBOutlet weak var hospitalNameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var identifierID: UITextField!
    
    private var x: CollectionReference!
    var idArrays = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x = Firestore.firestore().collection("users")
        setUpElements()

        // Do any additional setup after loading the view.
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
                    let identification = data["identifier ID"] as? String ?? ""
                    //print(document.data())
                    self.idArrays.append(identification)
                }
            }
        }
    }
    
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(hospitalNameTextField)
        Utilities.styleTextField(locationTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(identifierID)
        Utilities.styleFilledButton(signUpButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func validateFields() -> String?{
        if hospitalNameTextField.text?.trimmingCharacters(in:  .whitespacesAndNewlines) == "" || locationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || identifierID.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields,"
        }
        for i in idArrays{
            if identifierID.text?.trimmingCharacters(in: .whitespacesAndNewlines) == i{
                return "That ID has been taken. Please pick a different 8-10 digit numerical ID"
            }
            
        }
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false{
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        /*if cleanedPassword != cleanedPassword2 {
            return "Please make sure that both passwords are the same"
        }*/
        return nil
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
        else{
            let hospitalName = hospitalNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let location = locationTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let id = identifierID.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil{
                    self.showError("Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["hospitalname":hospitalName, "location":location,"identifier ID": id, "uid": result!.user.uid]) {(error)in }
                    if error != nil{
                        self.showError("Error saving user data")
                    }
                }
                self.transitionToHome()
            }
        }
    }
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHome(){
        let hospitalHomeViewControllerReal = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hospitalHomeViewController) as? hospitalHomeViewController
        
        self.view.window?.rootViewController = hospitalHomeViewControllerReal
        self.view.window?.makeKeyAndVisible()
        //performSegue(withIdentifier: "HospitalHomeViewController", sender: nil)
        
    }
    

}


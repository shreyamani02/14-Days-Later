//
//  SignUpViewController.swift
//  technovation2
//
//  Created by Shreya Mani on 4/8/20.
//  Copyright © 2020 Shreya Mani. All rights reserved.
//(Used Christopher Ching's tutorial on login and signup databases to help us learn how to  integrate firebase and xCode)
//

var globalFirstName = ""
var globalLastName = ""
var globalEmail = ""

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var checkInfected: UISwitch!
    
    @IBOutlet weak var identifierID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
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
        if firstNameTextField.text?.trimmingCharacters(in:  .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields,"
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
    var infected = false
    @IBAction func checkInfected(_ sender: UISwitch) {
        if(sender.isOn == true) {
            infected = true
        }
    }
    @IBAction func signUpTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
        else{
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            globalFirstName = firstName
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            globalLastName = lastName
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            globalEmail = email
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let id = identifierID.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil{
                    self.showError("Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName,"infected":self.infected, "id" :id, "uid": result!.user.uid]) {(error)in }
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
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
}

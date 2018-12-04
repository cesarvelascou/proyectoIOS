//
//  Register.swift
//  storyteller
//
//  Created by Cesar Velasco on 11/19/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirmation: UITextField!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        if password.text! == passwordConfirmation.text! {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                if error != nil {
                    print(error!)
                } else {
                    print("Signed Up")
                    self.performSegue(withIdentifier: "goToMenuFromSignUp", sender: self)
                }
            }//auth
        }//if
    }//button
}//general

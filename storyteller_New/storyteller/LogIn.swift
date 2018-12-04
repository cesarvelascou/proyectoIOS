//
//  LogIn.swift
//  storyteller
//
//  Created by Cesar Velasco on 11/19/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func logInPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Logged In")
                self.performSegue(withIdentifier: "goToMenuFromLogIn", sender: self)
            }//if-else
        }//auth
    }//button
}//general

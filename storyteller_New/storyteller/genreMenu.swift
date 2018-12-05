//
//  genreMenu.swift
//  storyteller
//
//  Created by Cesar Velasco on 11/19/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import UIKit
import Firebase

class genreMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Menu"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        //Esto porque puede fallar si no hay internet o algo por el estilo
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("There was a problemo.")
        }
    }
    
}//general

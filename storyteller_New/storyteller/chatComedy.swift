//
//  chatComedy.swift
//  storyteller
//
//  Created by Cesar Velasco on 12/5/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import Foundation
import Firebase

class chatComedyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Action"
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "messageID")
        retrieveMessages()
    }//viewDidLoad
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var messageArray : [Message] = [Message]()
}//general

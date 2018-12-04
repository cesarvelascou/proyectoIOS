//
//  chatAction.swift
//  storyteller
//
//  Created by Cesar Velasco on 11/19/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import UIKit

class chatActionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        messageTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "messageID")
        configureTableView()
    }//viewDidLoad
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBOutlet var messageTableView: UITableView!
    @IBOutlet var messageField: UITextField!
    @IBOutlet var sendButton: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }//numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageID", for: indexPath) as! NewTableViewCell
        let messageArray = ["mmmmm", "sssssssssssssssss ssss sssss ssssss sss", "aaaaaaaa"]
        cell.message.text = messageArray[indexPath.row]
        return cell
    }//cellForRowAt

    func configureTableView () {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }//configureTableView
    
}//general

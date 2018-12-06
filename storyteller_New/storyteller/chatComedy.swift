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
        navigationItem.title = "Comedy"
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "messageID")
        retrieveMessages()
    }//viewDidLoad
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var messageArray : [Message] = [Message]()
    @IBOutlet var messageTableView: UITableView!
    @IBOutlet var messageField: UITextField!
    
    @IBAction func sendPressed(_ sender: UIButton) {
        let messagesDB = Database.database().reference().child("comedyMessages")
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "Message": messageField.text!]
        //Crea una llave única para los mensajes y le asignamos el diccionario
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            if error != nil {
                print(error!)
            } else {
                print("Message saved.")
                self.messageField.text = ""
            }
        }
    }//sendPressed
    
    func retrieveMessages() {
        let messageDB = Database.database().reference().child("comedyMessages")
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>//Esto para que se tomen los dos parámetros tanto de usuario como de mensaje.
            let text = snapshotValue["Message"]!
            let sender = snapshotValue["Sender"]!
            print(text, sender)
            let message = Message()
            message.message = text
            message.user = sender
            
            self.messageArray.append(message)
            self.messageTableView.reloadData()
        }
    }//retrieveMessages
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }//numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageID", for: indexPath) as! NewTableViewCell
        cell.message.text = messageArray[indexPath.row].message
        cell.username.text = messageArray[indexPath.row].user
        return cell
    }//cellForRowAt
}//general

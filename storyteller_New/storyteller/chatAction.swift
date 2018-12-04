//
//  chatAction.swift
//  storyteller
//
//  Created by Cesar Velasco on 11/19/18.
//  Copyright © 2018 Cesar Velasco. All rights reserved.
//

import UIKit
import Firebase

class chatActionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "messageID")
    }//viewDidLoad
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var messageArray : [Message] = [Message]()
    @IBOutlet var messageTableView: UITableView!
    @IBOutlet var messageField: UITextField!

    @IBAction func sendPressed(_ sender: UIButton) {
        let messagesDB = Database.database().reference().child("actionMessages")
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
        //Se observan los mensajes
        let messageDB = Database.database().reference().child("actionMessages")
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>//Esto para que se tomen los dos parámetros tanto de usuario como de mensaje.
        }
    }//retrieveMessages
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }//numberOfRowsInSection
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageID", for: indexPath) as! NewTableViewCell
        let messageArray = ["mmmmm", "sssssssssssssssss ssss sssss ssssss sss", "aaaaaaaa"]
        cell.message.text = messageArray[indexPath.row]
        return cell
    }//cellForRowAt
}//general

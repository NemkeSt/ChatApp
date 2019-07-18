//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Mac on 6/3/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit
import Firebase

// CMD + A -> CTRL + I - formatiranje dosta znaci

class ChatViewController: UIViewController {
    
    // PROPERTIES SE DEFINISU NA POCETKU KLASE,
    // NI SLUCAJNO NA POLA FAJLA DA PRONALAZIM
    // PROPERTIES!!!
    // sredi to, da ti ne brisem sad @IBOutlets dole da ti se
    // ne izgubi referenca
    
    // @IBOutlets
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var tabela: UITableView!
    // Properties
    let user = Users()
    var messageArray : [Messages] = [Messages]()
    
    // MARK: - Navigation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabela.backgroundView = nil
        tabela.backgroundColor = UIColor.clear
        tabela.separatorColor = .clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
        retriveMessages()
    }
    
    // MARK: - @IBActions
    
    @IBAction func logOut(_ sender: Any) {
        
        // NAPRAVI NETWORK KLASU!!!
        // NI SLUCAJNO OVAKVE STVARI SMESTATI U VIEW CONTROLLER!!!
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("error, there was a problem signing out.")
        }
        // OVO NIKAKO !!!
        // pogledaj komentar u appDidFinishLaunching u AppDelegate-u
        guard   (navigationController?.popToRootViewController(animated: true)) != nil
            else {
                print("No view Controllers to pop off")
                return
        }
    }
    
    // MARK: - Selectors
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func send(_ sender: UIButton) {
        if textView.text != "" {
            textView.endEditing(true)
            textView.isEditable = false
            sendButton.isEnabled = false
            
            
            // NAPRAVI POSEBNU METODU ZA OVO
            // NAPRAVI PERSISTENCE KLASU ZA RAD SA BAZOM
            // NIKAKO UBACIVATI DIREKTAN RAD SA BAZOM/NETWORK-OM
            // U @IBACTIONS
            let messagesDB = Database.database().reference().child("Messages")
            let messageDictionary = ["Sender": Auth.auth().currentUser?.email ,"MessageBody": textView.text!, "fromId": Auth.auth().currentUser?.uid, "toID": keyUser ]
            messagesDB.childByAutoId().setValue(messageDictionary) {
                (error, reference) in
                
                if error != nil {
                    print(error!)
                } else {
                    print("Message saved succesfuly")
                    
                    self.textView.text = ""
                    self.sendButton.isEnabled = true
                    self.textView.isEditable = true
                }
            }
            
        }
    }
    
    
    
    // POSEBNA METODA
    func retriveMessages() {
        
        let DBmessage = Database.database().reference().child("Messages")
        
        DBmessage.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            let message = Messages()
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)
            self.tabela.reloadData()
            
        }
        
    }
}

// DELEGATE U EKSTENZIJE
// mnogo je preglednije

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "celija", for: indexPath) as! CellDataChat
        myCell.messageBodyTextView.text = messageArray[indexPath.row].messageBody
        return myCell
    }
}







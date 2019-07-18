//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Mac on 6/3/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        email.placeholder = "Email"
        pass.placeholder = "Password"
        name.placeholder = "Name"
        pass.isSecureTextEntry = true
        // Do any additional setup after loading the view.
        
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func hideKeybord() {
        view.endEditing(true)
    }
    
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
   
    @IBAction func register(_ sender: Any) {
        
        
        Auth.auth().createUser(withEmail: email.text!, password: pass.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                
                let userDB = Database.database().reference().child("Users")
                let usersDictionary = ["email": self.email.text,
                                       "name": self.name.text]
                
                
                userDB.childByAutoId().setValue(usersDictionary) {
                    (error, reference) in
                    if error != nil {
                        print("An error occured!")
                    } else {
                        print("User created sucesfuly")
                        
                        
                    }
                }
                
                print("Registration succesful")
                
                
                let story = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = story.instantiateViewController(withIdentifier: "user")
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
        
    }
    
}

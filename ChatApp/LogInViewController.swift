//
//  LogInViewController.swift
//  ChatApp
//
//  Created by Mac on 6/3/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit
import Firebase



class LogInViewController: UIViewController {

    override func viewDidLoad() {
        email.placeholder = "Email"
        logIn.placeholder = "Password"
        logIn.isSecureTextEntry = true
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeybord))
        view.addGestureRecognizer(tap)
       
    }
    @objc func hideKeybord() {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var logIn: UITextField!
    
    

    @IBAction func logIn(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: logIn.text!) { (user, error) in
            
            if error != nil {
                print(error!)
            }else {
                print("LogIn Uspesan")
                
                let story = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = story.instantiateViewController(withIdentifier: "user")
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
        
        
    }
    
}

    


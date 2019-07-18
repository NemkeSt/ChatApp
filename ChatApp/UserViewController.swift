//
//  UserViewController.swift
//  ChatApp
//
//  Created by Mac on 6/13/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit
import Firebase


var user = ""
var keyUser : String?

class UserViewController: UIViewController {
    
    
    var userArray: [Users] = [Users]()
    
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        fetchUser()
       retriveUserDB()
        
  
        
    }
    
    func retriveUserDB() {
        let userDB = Database.database().reference().child("Users")
        userDB.observe(.childAdded) {
            (snapshot) in
            let snapShotValue = snapshot.value as! Dictionary<String,String>
            
           
            let email = snapShotValue["email"]!
            let name = snapShotValue["name"]!
            
            
            let user = Users()
            user.userEmail = email
           user.userName = name
            
            
            
            
            self.userArray.append(user)
            self.table.reloadData()
            
        }
    }


}

extension UserViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellDataUser
        cell.userEmail.text = userArray[indexPath.row].userEmail
        cell.userName.text = userArray[indexPath.row].userName
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
           
            keyUser = userArray[indexPath.row].sender
            print(keyUser!)
     
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "chat")
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
   
}
    
    func fetchUser() {

        let keyDB = Database.database().reference().child("Users")
                keyDB.observe(.childAdded) { (snapshot) in
                    if let dictionary = snapshot.value as?  [String: AnyObject] {

                            user = snapshot.key


                    }
                }

    }




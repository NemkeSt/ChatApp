////
////  FileManager.swift
////  ChatApp
////
////  Created by Mac on 6/21/19.
////  Copyright © 2019 NemanjaStojanovic. All rights reserved.
////
//
//import Foundation
//import Firebase
//
//class FileManager {
//
//
//
//    func createUserDB() {
//        let userDB = Database.database().reference().child("Users")
//        let usersDictionary = ["email": Auth.auth().currentUser?.email,
//                               "name": Auth.auth().currentUser?.displayName]
//
//        
//        userDB.childByAutoId().setValue(usersDictionary) {
//            (error, reference) in
//            if error != nil {
//                print("An error occured!")
//            } else {
//                print("User created sucesfuly")
//
//
//            }
//        }
//    }
//
//
//}
//
//func updateUser() {
//    let user = Auth.auth().currentUser
//    if let user = user {
//        let changeRequest = user.createProfileChangeRequest()
//
//        changeRequest.displayName = "Nemanja"
//        changeRequest.commitChanges { error in
//            if let error = error {
//                print(error)
//            } else {
//                print("Profile updated")
//            }
//        }
//
//    }
//}
//
//

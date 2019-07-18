//
//  ViewController.swift
//  ChatApp
//
//  Created by Mac on 6/3/19.
//  Copyright © 2019 NemanjaStojanovic. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    @IBAction func login(_ sender: Any) {
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "login")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func register(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "register")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
  
//    let buttonViewRegister: UIButton = {
//
//
//        let button = UIButton()
//        button.backgroundColor = .blue
//        button.setTitle("Register", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//      //  button.addTarget(self , action: #selector(toRegister), for: .touchUpInside)
//        return button
//    }()
//
//    let buttonViewLogIn: UIButton = {
//
//
//        let button = UIButton()
//        button.backgroundColor = UIColor.lightGray
//        button.setTitle("LogIn", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//       // button.addTarget(self , action: #selector(toLogin), for: .touchUpInside)
//
//        return button
//    }()
//
//
//    func stackView() {
//
//        let stack = UIStackView(arrangedSubviews: [buttonViewRegister,buttonViewLogIn])
//        view.addSubview(stack)
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.distribution = .fillEqually
//        stack.spacing = 0
//        stack.axis = .vertical
//
//        NSLayoutConstraint.activate([
//            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
//            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
//            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
//            stack.heightAnchor.constraint(equalToConstant: 100),
//            ])
//
//    }
   
    
//    @objc func toRegister(){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let VC = storyBoard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
//        self.present(VC, animated: true, completion: nil)
//    }
//
//    @objc func toLogin(){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let VC = storyBoard.instantiateViewController(withIdentifier: "login") as! LogInViewController
//        self.present(VC, animated: true, completion: nil)
//    }
    
   

}


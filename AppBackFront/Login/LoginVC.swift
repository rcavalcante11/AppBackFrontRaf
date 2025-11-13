//
//  ViewController.swift
//  AppBackFront
//
//  Created by macbook on 30/06/2025.
//

import UIKit

class LoginVC : UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.delegate(delegate: self)
    }


}

extension LoginVC : LoginScreenProtocol {
    func tappedLoginButton() {
        print(#function)
    }
    
    
}

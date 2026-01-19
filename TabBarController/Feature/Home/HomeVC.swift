//
//  HomeVC.swift
//  AppBackFront
//
//  Created by macbook on 02/12/2025.
//


import UIKit

class HomeVC: UIViewController {
    
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    



}

//
//  UIViewController+Extension.swift
//  AppBackFront
//
//  Created by macbook on 13/11/2025.
//

import Foundation
import UIKit

extension UIViewController{
    func dismisskeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
}

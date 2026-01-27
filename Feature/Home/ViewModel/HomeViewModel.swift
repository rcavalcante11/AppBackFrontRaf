//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by macbook on 21/01/2026.
//

import UIKit

class HomeViewModel {
    
    private let service: HomeService = HomeService()
    
    public func fetchrequest() {
        service.getHomeFromJson{ result, failure in
            if  let result { print("Success")}
            else{ print("pobrema")}
                
            }
        }
            
    }

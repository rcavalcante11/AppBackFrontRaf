//
//  GenericService.swift
//  AppBackFront
//
//  Created by macbook on 21/01/2026.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case fileNotFound(name : String)
    case fileDecoding(name: String, Swift.Error)
    case errorRequest(AFError)
}

protocol GenericService: AnyObject {
    typealias Completion <T> = (_ Result: T, _ failure:    Error?) -> Void
}

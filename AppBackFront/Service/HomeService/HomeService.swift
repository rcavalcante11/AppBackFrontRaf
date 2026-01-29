//
//  HomeService.swift
//  AppBackFront
//
//  Created by macbook on 21/01/2026.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHomeFromJson(completion: @escaping Completion<NFTData?>)
    func getHome(completion: @escaping Completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    func getHome(completion: @escaping Completion<NFTData?>) {
        let url : String = "/Users/macbook/Desktop/PROJETOS BACKFRONT/AppBackFront/AppBackFront/Json/HomeData.json"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) {response in
        debugPrint(response)
            switch response.result{
            case .success(let Success):
                print ("Success caraio \(#function)")
                completion(Success, nil)
            case .failure(let error ):
                print ("error \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    

    func getHomeFromJson(completion: @escaping Completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData,nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
        }
    

    
}

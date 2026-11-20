//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by macbook on 21/01/2026.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
    
}
class HomeViewModel {
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    weak private var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate){
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch ) {
        
        switch typeFetch {
        case .mock:
            service.getHomeFromJson{ result, failure in
                if  let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome{ result, failure in
                if  let result {
                    self.nftData = result
                    self.delegate?.success()
                    
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
        
    }
    
    // MARK: - FilterCollectionView
    
    public var numberOfItensInSection: Int {
        return nftData?.filterListNft?.count ?? 0
    }
    
    
    public func loadCurrentFilterNft(indexpath: IndexPath) -> FilterNft {
        return nftData?.filterListNft?[indexpath.row] ?? FilterNft()
    }
    
    public  var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    // MARK: - NftTableViewCell
    public var numberOfRowsInSection: Int {
        
        return nftData?.nftList?.count ?? 0
        
    }
    
    public func loadCurrentNft(indexpath: IndexPath) -> Nft {
        return nftData?.nftList?[indexpath.row] ?? Nft()
    }
    
    public  var heightForRowAt: CGFloat {
        return 360
    }
    
}




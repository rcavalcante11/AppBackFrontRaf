//
//  NftFilterCollectionViewCellScreen.swift
//  AppBackFront
//
//  Created by macbook on 26/02/2026.
//

import UIKit

class NftFilterCollectionViewCellScreen: UIView {
    
    
    lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    func addViews(){
        addSubview(filterLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    

}

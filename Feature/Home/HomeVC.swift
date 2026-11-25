//
//  HomeVC.swift
//  AppBackFront
//
//  Created by macbook on 02/12/2025.
//


import UIKit

class HomeVC: UIViewController {
    
    
    var screen: HomeScreen?
    var viewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configSearchBarDelegate(delegate: self)
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)
        
        
    }
    

}

extension HomeVC: HomeViewModelDelegate{
    func success() {
        print(#function)
        DispatchQueue.main.async {
            self.screen?.configcollectionViewProtocols(delegate: self, dataSource: self)
            self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.screen?.tableview.reloadData()
            }
        }
        
    
    func error() {
        print(#function)
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItensInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NftFilterCollectionViewCell.identifier, for: indexPath) as? NftFilterCollectionViewCell
        cell?.setupCell(filter: viewModel.loadCurrentFilterNft(indexpath: indexPath))
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt
        
    }
}
 
extension HomeVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NftTableViewCell.identifier, for: indexPath) as? NftTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentNft(indexpath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSearchText(searchText)
        screen?.tableview.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

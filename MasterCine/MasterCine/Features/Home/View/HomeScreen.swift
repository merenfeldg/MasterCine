//
//  HomeScreen.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 21/05/26.
//

import UIKit

final class HomeScreen: UIBaseView {
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Pesquise pelo nome do filme"
        searchBar.searchBarStyle = .default
        searchBar.showsCancelButton = false
        
        return searchBar
    }()
    
    lazy var moviesTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = DSColor.greyNormal
        
        return tableView
    }()
}

//MARK: - CONFIG PROTOCOLS
extension HomeScreen {
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        moviesTableView.delegate = delegate
        moviesTableView.dataSource = dataSource
    }
    
    func configSearchBarProtocol(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}

//MARK: - CONFIG VIEW
extension HomeScreen {
    private func configView() {
        backgroundColor = DSColor.background
        addElements()
        super.disableTranslatesAutoresizingMaskInAllElements()
        configConstraints()
    }
    
    private func addElements() {
        addSubview(searchBar)
        addSubview(moviesTableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            moviesTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            moviesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

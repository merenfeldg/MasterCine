//
//  HomeViewController.swift
//  MasterCine
//
//  Created by Gabriel Merenfeld on 14/05/26.
//

import UIKit

final class HomeViewController: UIBaseViewController {
    let screen: HomeScreen = HomeScreen()
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configProtocols() {
        screen.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

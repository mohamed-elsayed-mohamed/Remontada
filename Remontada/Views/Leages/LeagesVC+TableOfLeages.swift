//
//  LeagesVC+TableOfLeages.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

extension LeagesVC: UITableViewDelegate{
    func setupTableView() {
        leagesTableView.delegate = self
        leagesTableView.dataSource = self
        leagesTableView.register(UINib(nibName: CellsIDs.leagues, bundle: nil), forCellReuseIdentifier: CellsIDs.leagues)
    }
}

extension LeagesVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCellsCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIDs.leagues, for: indexPath) as! LeageCell
        presenter.insertCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.selectCell(index: indexPath.row)
        let detailsVC = self.storyboard!.instantiateViewController(withIdentifier: ViewsIDs.leagueDetails) as! DetailsVC
        
        DetailsVC.leagueID = self.presenter.getLeagueID(index: indexPath.row)
        let navController = UINavigationController(rootViewController: detailsVC)
        self.present(navController, animated:true, completion: nil)
    }
    
}

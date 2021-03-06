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
        
        refreshControl.attributedTitle = NSAttributedString(string: "Reload")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        leagesTableView.addSubview(refreshControl)
    }
    
    
    @objc func refresh(_ sender: UIRefreshControl) {
        if(presenter.getCellsCount() == 0){
            self.presenter.getLeages(sportName: sportName!)
            self.refreshControl.endRefreshing()
            self.leagesTableView.contentOffset = CGPoint.zero
        }
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
        navigateToLeagueDetails(index: indexPath.row)
    }
    
    private func navigateToLeagueDetails(index: Int){
        if(BaseAPI().isConnectedToInternet()){
            self.presenter.selectCell(index: index)
            let detailsVC = self.storyboard!.instantiateViewController(withIdentifier: ViewsIDs.leagueDetails) as! DetailsVC
            
            DetailsVC.leagueID = self.presenter.getLeagueID(index: index)
            detailsVC.setPresenter_Index(presenter: self.presenter, index: index, leagueName: self.presenter.getLeagueName(index: index))
            let navController = UINavigationController(rootViewController: detailsVC)
            self.present(navController, animated:true, completion: nil)
        }else{
            let actionsheet = UIAlertController(title: "Can not load leage data!", message: "It seems that you are not connected with the internet please reconnect and try again!", preferredStyle: .actionSheet)
            
            actionsheet.addAction(UIAlertAction(title: "Retray", style: .default, handler: {
                action in
                self.navigateToLeagueDetails(index: index)
            }))
            
            actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(actionsheet, animated: true, completion: nil)
        }
    }
}

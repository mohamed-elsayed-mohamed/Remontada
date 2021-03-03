//
//  TeamsCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class TeamsCell: UITableViewCell, APIProtocol {
    
    @IBOutlet weak var teamsTableViewCell: UICollectionView!
    private var presenter: TeamsPresenter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupMyCollectionView()
        presenter = TeamsPresenter(teamsView: self, leagueID: DetailsVC.leagueID!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func fetchingDataSuccess() {
        teamsTableViewCell.reloadData()
    }
    
    func showError(error: String) {
        
    }
}

extension TeamsCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func setupMyCollectionView() {
        teamsTableViewCell.delegate = self
        teamsTableViewCell.dataSource = self
        teamsTableViewCell.register(UINib(nibName: CellsIDs.teamCell, bundle: nil), forCellWithReuseIdentifier: CellsIDs.teamCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getCellsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIDs.teamCell, for: indexPath) as! TeamCell
        presenter.insertCell(cell: cell, index: indexPath.row)
        return cell
    }
}

//
//  UpcomingEventsCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit
import SwiftSpinner

class UpcomingEventsCell: UITableViewCell, APIProtocol {
    
    @IBOutlet weak var UpcomingEventsCollectionView: UICollectionView!
    private var presenter: UpcomingEventsPresenter!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupMyCollectionView()
        
        presenter = UpcomingEventsPresenter(upcommingView: self)
        presenter.getEvents(leageID: DetailsVC.leagueID!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func showIndicator() {
    }
    
    func hideIndicator() {
    }
    
    func fetchingDataSuccess() {

        self.UpcomingEventsCollectionView.reloadData()
    }
    
    func showError(error: String) {
        
    }
    
    func showInternetMessage(message: String) {
    }
    
}

extension UpcomingEventsCell: UICollectionViewDelegate{
    func setupMyCollectionView() {
        UpcomingEventsCollectionView.delegate = self
        UpcomingEventsCollectionView.dataSource = self
        UpcomingEventsCollectionView.register(UINib(nibName: CellsIDs.eventCell, bundle: nil), forCellWithReuseIdentifier: CellsIDs.eventCell)
    }
}

extension UpcomingEventsCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getCellsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIDs.eventCell, for: indexPath) as! EventCell
        presenter.inserCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectCell(index: indexPath.row)
    }
}

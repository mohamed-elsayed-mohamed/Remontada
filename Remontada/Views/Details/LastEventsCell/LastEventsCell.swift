//
//  LastEventsCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class LastEventsCell: UITableViewCell, APIProtocol {

    @IBOutlet weak var lastEventsCollectionView: UICollectionView!
    private var presenter: LastEventsPresenter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupMyCollectionView()
        presenter = LastEventsPresenter(upcommingView: self, leagueID: DetailsVC.leagueID!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func fetchingDataSuccess() {
        lastEventsCollectionView.reloadData()
    }
    
    func showError(error: String) {
        
    }
}

extension LastEventsCell: UICollectionViewDelegate{
    func setupMyCollectionView() {
        lastEventsCollectionView.delegate = self
        lastEventsCollectionView.dataSource = self
        lastEventsCollectionView.register(UINib(nibName: CellsIDs.eventCell, bundle: nil), forCellWithReuseIdentifier: CellsIDs.eventCell)
    }
}

extension LastEventsCell: UICollectionViewDataSource{
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



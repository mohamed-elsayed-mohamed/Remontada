//
//  SportsVC+CollectionView.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

private let cellID = "SportCell"

extension SportsVC: UICollectionViewDelegate{
    func setupMyCollectionView() {
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
}

extension SportsVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getSportsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SportCell
        presenter.inserCell(cell: cell, for: indexPath.row)
        return cell
    }
}

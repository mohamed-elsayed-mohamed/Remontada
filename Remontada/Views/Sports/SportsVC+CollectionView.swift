//
//  SportsVC+CollectionView.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

extension SportsVC: UICollectionViewDelegate{
    func setupMyCollectionView() {
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.register(UINib(nibName: CellsIDs.sports, bundle: nil), forCellWithReuseIdentifier: CellsIDs.sports)
    }
}

extension SportsVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getCellsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIDs.sports, for: indexPath) as! SportCell
        presenter.insertCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectCell(index: indexPath.row)
        let leagesView = self.storyboard!.instantiateViewController(withIdentifier: "leagesView") as! LeagesVC
        leagesView.sportName = presenter.getSelectedSport().name
        self.navigationController?.pushViewController(leagesView, animated: true)
    }
}

extension SportsVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2
        let height = width - 50
        
        return CGSize(width: width, height: height)
    }
}



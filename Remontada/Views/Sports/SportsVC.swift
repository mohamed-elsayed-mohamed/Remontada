//
//  SportsVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

class SportsVC: UIViewController, SportsViewProtocol {

    var presenter: SportsPresenter!
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMyCollectionView()
        presenter = SportsPresenter(sportsView: self)
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func fetchingDataSuccess() {
        sportsCollectionView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
}

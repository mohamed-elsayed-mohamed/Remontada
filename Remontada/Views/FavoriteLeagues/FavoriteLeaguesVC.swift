//
//  FavoriteLeaguesVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 03/03/2021.
//

import UIKit

class FavoriteLeaguesVC: UIViewController, CoreDataProtocol {

    internal var presenter: FavoriteLeaguesPresenter!
    
    @IBOutlet weak var myFavoriteLeaguesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FavoriteLeaguesPresenter(favoriteLeagesView: self)
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.getAllFavorite()
    }
    
    func fetchingDataSuccess() {
        self.myFavoriteLeaguesTableView.reloadData()
    }
    
    func showMessage(message: String) {
        
    }
    
    func deleteLeagueFromFavorite(index: Int) {
        
    }
}

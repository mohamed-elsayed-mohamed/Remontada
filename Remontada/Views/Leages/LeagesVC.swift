//
//  LeagesVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

class LeagesVC: UIViewController, APIProtocol{
    
    internal var sportName: String?
    internal var presenter: LeagesPresenter!

    @IBOutlet internal weak var lblLeagueName: UILabel!
    @IBOutlet internal weak var leagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter = LeagesPresenter(leagesView: self, sportName: self.sportName!)
        self.lblLeagueName.text = self.sportName
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func fetchingDataSuccess() {
        leagesTableView.reloadData()
    }
    
    func showError(error: String) {
        // print(error)
    }
}

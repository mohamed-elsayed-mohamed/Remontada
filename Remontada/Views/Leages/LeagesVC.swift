//
//  LeagesVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit
import SwiftSpinner

class LeagesVC: UIViewController, APIProtocol{
    
    internal var sportName: String?
    internal var presenter: LeagesPresenter!
    internal let refreshControl = UIRefreshControl()
    
    @IBOutlet internal weak var lblLeagueName: UILabel!
    @IBOutlet internal weak var leagesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter = LeagesPresenter(leagesView: self)
        self.lblLeagueName.text = self.sportName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(presenter.getCellsCount() == 0){
            self.presenter.getLeages(sportName: self.sportName!)
        }
    }
    
    func showIndicator() {
        SwiftSpinner.show("Loading Leagues")
    }
    
    func hideIndicator() {
        SwiftSpinner.hide()
    }
    
    func fetchingDataSuccess() {
        refreshControl.removeFromSuperview()
        leagesTableView.reloadData()
    }
    
    func showError(error: String) {
        self.hideIndicator()
        let alert = UIAlertController(title: "Something wrong happened", message: error, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Retray", style: .default, handler: {
            action in
            self.presenter.getLeages(sportName: self.sportName!)
        }))
        
        alert.addAction(UIAlertAction(title: "Go back", style: .default, handler: {
            action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showInternetMessage(message: String) {
        self.hideIndicator()
        
        let actionsheet = UIAlertController(title: message, message: "It seems that you are not connected with the internet please reconnect and try again!", preferredStyle: .actionSheet)
        
        actionsheet.addAction(UIAlertAction(title: "Retray", style: .default, handler: {
            action in
            self.presenter.getLeages(sportName: self.sportName!)
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Go to favorite", style: .default, handler: {
            action in
            self.tabBarController?.selectedIndex = 1
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Go back", style: .default, handler: {
            action in
            self.navigationController?.popViewController(animated: true)
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionsheet, animated: true, completion: nil)
    }
}

//
//  SportsVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit
import SwiftSpinner

class SportsVC: UIViewController, APIProtocol {
    var presenter: SportsPresenter!
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMyCollectionView()
        presenter = SportsPresenter(sportsView: self)
        presenter.getSports()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(gotoFavorite))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipedown = UISwipeGestureRecognizer(target: self, action: #selector(updateSportsList))
        swipedown.direction = .down
        self.view.addGestureRecognizer(swipedown)
    }
    
    @objc func gotoFavorite(){
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func updateSportsList(){
        self.presenter.getSports()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(presenter.getCellsCount() == 0){
            self.presenter.getSports()
        }
    }
    
    func showIndicator() {
        SwiftSpinner.show("Loading Sports")
    }
    
    func hideIndicator() {
        SwiftSpinner.hide()
    }
    
    func fetchingDataSuccess() {
        sportsCollectionView.reloadData()
    }
    
    func showError(error: String) {
        self.hideIndicator()
        let alert = UIAlertController(title: "Something wrong happened", message: error, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Retray", style: .default, handler: {
            action in
            self.presenter.getSports()
        }))
        
        alert.addAction(UIAlertAction(title: "Go to favorite", style: .default, handler: {
            action in
            self.tabBarController?.selectedIndex = 1
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func showInternetMessage(message: String) {
        self.hideIndicator()
        let actionsheet = UIAlertController(title: message, message: "It seems that you are not connected with the internet please reconnect to get all sports or go to your favorite leagues", preferredStyle: .actionSheet)
        
        actionsheet.addAction(UIAlertAction(title: "Retray", style: .default, handler: {
            action in
            self.presenter.getSports()
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Go to favorite", style: .default, handler: {
            action in
            self.tabBarController?.selectedIndex = 1
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionsheet, animated: true, completion: nil)
    }
    
}

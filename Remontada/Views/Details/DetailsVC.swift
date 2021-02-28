//
//  DetailsVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var favoritebtn: UIButton!
    @IBOutlet weak var detailsTableView: UITableView!
    
    private var isFavorite: Bool?
    public static var leagueID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isFavorite = true
        setupMyTableView()
    }
    
    @IBAction func btnFavorite(_ sender: Any) {
        var imageName: String = "heart.fill"
        if(isFavorite!){
            imageName = "heart"
        }
        
        isFavorite = !isFavorite!
        
        favoritebtn.setBackgroundImage(UIImage(systemName: imageName), for: .normal)
    }
}

extension DetailsVC: UITableViewDelegate, UITableViewDataSource{
    
    func setupMyTableView() {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        detailsTableView.register(UINib(nibName: CellsIDs.upcomingEvents, bundle: nil), forCellReuseIdentifier: CellsIDs.upcomingEvents)
        
        detailsTableView.register(UINib(nibName: CellsIDs.lastEvents, bundle: nil), forCellReuseIdentifier: CellsIDs.lastEvents)
        
        detailsTableView.register(UINib(nibName: CellsIDs.teamsCell, bundle: nil), forCellReuseIdentifier: CellsIDs.teamsCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if(indexPath.section == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: CellsIDs.upcomingEvents, for: indexPath) as! UpcomingEventsCell
        } else if(indexPath.section == 1){
            cell = tableView.dequeueReusableCell(withIdentifier: CellsIDs.lastEvents, for: indexPath) as! LastEventsCell
        } else if(indexPath.section == 2){
            cell = tableView.dequeueReusableCell(withIdentifier: CellsIDs.teamsCell, for: indexPath) as! TeamsCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 150
        } else if(indexPath.section == 1){
            return 400
        } else if(indexPath.section == 2){
            return 150
        }
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Upcoming Events"
        } else if(section == 1){
            return "Last Events"
        } else if(section == 2){
            return "Teams"
        }
        
        return "MoElsayed1995"
    }
    
}

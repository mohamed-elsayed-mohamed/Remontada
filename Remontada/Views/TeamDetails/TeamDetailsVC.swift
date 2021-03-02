//
//  TeamDetailsVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 01/03/2021.
//

import UIKit

class TeamDetailsVC: UIViewController, APIProtocol {

    @IBOutlet weak var imgStadium: UIImageView!
    @IBOutlet weak var imgBadge: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLeague: UILabel!
    @IBOutlet weak var lbCountry: UILabel!
    @IBOutlet weak var lblFounded: UILabel!
    @IBOutlet weak var lblStadium: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    private var teamID: String!
    private var presenter: TeamDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TeamDetailsPresenter(teamDetailsView: self, teamID: teamID!)
    }
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func fetchingDataSuccess() {
        let team: Team = presenter!.getTeamDetails()
        if(team.stadiumImgURL != nil){
            self.imgStadium.sd_setImage(with: URL(string: team.stadiumImgURL!), placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        if(team.imgURL != nil){
            self.imgBadge.sd_setImage(with: URL(string: team.imgURL!), placeholderImage: UIImage(named: "placeholder.png"))
        }
        
        lblName.text = team.name
        lblLeague.text = team.league
        lbCountry.text = team.country
        lblFounded.text = team.foundedIn
        lblStadium.text = team.stadiumName
        lblDescription.text = team.description
    }
    
    func showError(error: String) {
        
    }
    
    func setTeamID(ID: String?) {
        self.teamID = ID
    }
    
}

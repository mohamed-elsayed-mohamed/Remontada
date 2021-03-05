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
    
    @IBOutlet weak var viewContent: UIView!
    
    private var teamID: String!
    private var presenter: TeamDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TeamDetailsPresenter(teamDetailsView: self)
        presenter!.getTeamData(teamID: teamID)
        
        let tapToClose = UITapGestureRecognizer(target: self, action: #selector(self.dismiss(animated: completion:)))
        
        tapToClose.numberOfTapsRequired = 2
        
        self.view.addGestureRecognizer(tapToClose)
    }
    
    func showIndicator() {}
    
    func hideIndicator() {}
    
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
        if(team.country != nil && team.country!.count > 1){
            lbCountry.text = team.country
        }
        
        if(team.foundedIn != nil && team.foundedIn!.count > 1){
            lblFounded.text = team.foundedIn
        }
        
        if(team.stadiumName != nil && team.stadiumName!.count > 1){
            lblStadium.text = team.stadiumName
        }
        
        if(team.description != nil && team.description!.count > 1){
            lblDescription.text = team.description
        }
        
        /*
        let contentSize = self.lblDescription.sizeThatFits(self.lblDescription.bounds.size)
        
        let height = lblDescription.frame.origin.y + contentSize.height + 20
        print(height)
        print(self.viewContent.frame.height)
        self.viewContent.frame = CGRect(x: 0,y: 0,width: self.viewContent.frame.width,height: +height)
        print(self.viewContent.frame.height)
         */
    }
    
    func showError(error: String) {}
    
    func setTeamID(ID: String?) {
        self.teamID = ID
    }
    
    func showInternetMessage(message: String) {}
}

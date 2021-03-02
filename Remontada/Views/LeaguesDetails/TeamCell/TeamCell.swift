//
//  TeamCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class TeamCell: UICollectionViewCell, TeamCellProtocol {

    @IBOutlet weak var teamImg: UIButton!
    
    private var teamID: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func btnImage(_ sender: Any) {
        self.navigateToTeamsView()
    }
    
    func displayImg(imgURL: String?) {
        if(imgURL != nil){
            self.layer.cornerRadius = self.frame.size.width/2
            self.teamImg.sd_setBackgroundImage(with: URL(string: imgURL!), for: .normal)
        }
    }
    
    func setTeamID(teamID: String) {
        self.teamID = teamID
    }

    func navigateToTeamsView() {
        let currentView: UIViewController = self.window!.rootViewController!
        
        let teamDetailsView = currentView.storyboard!.instantiateViewController(withIdentifier: ViewsIDs.teamDetails) as! TeamDetailsVC
        teamDetailsView.setTeamID(ID: teamID)
        
        currentView.dismiss(animated: false, completion: nil)
        currentView.present(teamDetailsView, animated:true, completion: nil)
    }
}

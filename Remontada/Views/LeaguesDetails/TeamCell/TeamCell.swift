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
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderWidth = 2
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.30)
        if(imgURL != nil){
            self.teamImg.sd_setBackgroundImage(with: URL(string: imgURL!), for: .normal)
        }else{
            self.teamImg.setBackgroundImage(UIImage(named: "teams.jpg"), for: .normal)
        }
    }
    
    func setTeamID(teamID: String) {
        self.teamID = teamID
    }

    func navigateToTeamsView() {
        let currentView: UIViewController = self.window!.rootViewController!
        
        if(BaseAPI().isConnectedToInternet()){
            let teamDetailsView = currentView.storyboard!.instantiateViewController(withIdentifier: ViewsIDs.teamDetails) as! TeamDetailsVC
            teamDetailsView.setTeamID(ID: teamID)
            
            currentView.presentedViewController!.present(teamDetailsView, animated: true, completion: nil)
        }else{
            let actionsheet = UIAlertController(title: "No Internet Connection", message: "It seems that you are not connected with the internet please reconnect to get your team information", preferredStyle: .actionSheet)
            
            actionsheet.addAction(UIAlertAction(title: "Retray", style: .default, handler: {
                action in
                self.navigateToTeamsView()
            }))
            
            actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            currentView.presentedViewController!.present(actionsheet, animated: true, completion: nil)
        }
    }
}

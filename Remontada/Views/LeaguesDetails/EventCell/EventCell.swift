//
//  EventCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class EventCell: UICollectionViewCell, EventCellProtocol {
    @IBOutlet weak var ImgTeamA: UIImageView!
    @IBOutlet weak var ImgTeamB: UIImageView!
    
    @IBOutlet weak var lblTeamA: UILabel!
    @IBOutlet weak var lblTeamB: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var teamAResView: UIView!
    @IBOutlet weak var teamBResView: UIView!
    @IBOutlet weak var lblARes: UILabel!
    @IBOutlet weak var lblBRes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }
    
    func displayImgs(teamAURL: String?, teamBURL: String?) {
        if(teamAURL != nil){
            self.ImgTeamA.sd_setImage(with: URL(string: teamAURL!), placeholderImage: UIImage(named: "teams.jpg"))
        }else{
            self.ImgTeamA.image = UIImage(named: "teams.jpg")
        }
        
        if(teamBURL != nil){
            
            self.ImgTeamB.sd_setImage(with: URL(string: teamBURL!), placeholderImage: UIImage(named: "teams.jpg"))
        }else{
            self.ImgTeamB.image = UIImage(named: "teams.jpg")
        }
    }
    
    func displayNames(teamA: String, teamB: String) {
        self.lblTeamA.text = teamA
        self.lblTeamB.text = teamB
    }
    
    func displayDateTime(date: String?, time: String?) {
        if(date != nil && date!.count > 1){
            self.lblDate.text = date!
        }else{
            self.lblDate.text = "N/A"
        }
        
        if(time != nil && time!.count > 1){
            self.lblTime.text = time!
        }else{
            self.lblTime.text = "N/A"
        }
    }
    
    func displayResults(teamARes: String?, teamBRes: String?) {
        self.teamAResView.layer.cornerRadius = self.teamAResView.frame.size.width/2
        self.teamBResView.layer.cornerRadius = self.teamBResView.frame.size.width/2
        self.teamAResView.layer.borderWidth = 1
        self.teamAResView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        self.teamBResView.layer.borderWidth = 1
        self.teamBResView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        
        self.teamAResView.isHidden = false
        self.teamBResView.isHidden = false
        
        if(teamARes != nil){
            self.lblARes.text = teamARes
        }else{
            self.lblARes.text = "N"
        }
        
        if(teamBRes != nil){
            self.lblBRes.text = teamBRes
        }else{
            self.lblBRes.text = "N"
        }
    }
}

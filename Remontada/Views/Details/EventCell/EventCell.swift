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
    }
    
    func displayImgs(teamAURL: String?, teamBURL: String?) {
        if(teamAURL != nil){
            self.ImgTeamA.sd_setImage(with: URL(string: teamAURL!), placeholderImage: UIImage(named: "placeholder.png"))
        }
        if(teamBURL != nil){
            self.ImgTeamB.sd_setImage(with: URL(string: teamBURL!), placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    func displayNames(teamA: String, teamB: String) {
        self.lblTeamA.text = teamA
        self.lblTeamB.text = teamB
    }
    
    func displayDateTime(date: String?, time: String?) {
        if(date != nil){
            self.lblDate.text = date!
        }
        if(time != nil){
            self.lblTime.text = time!
        }
    }
    
    func displayResults(teamARes: String?, teamBRes: String?) {
        self.teamAResView.layer.cornerRadius = self.teamAResView.frame.size.width/2
        self.teamBResView.layer.cornerRadius = self.teamBResView.frame.size.width/2
        
        self.teamAResView.isHidden = false
        self.teamBResView.isHidden = false
        
        self.lblARes.text = teamARes
        self.lblBRes.text = teamBRes
    }
}

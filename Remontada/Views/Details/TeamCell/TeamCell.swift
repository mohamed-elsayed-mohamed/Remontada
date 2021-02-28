//
//  TeamCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class TeamCell: UICollectionViewCell, TeamCellProtocol {

    @IBOutlet weak var teamImg: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func btnImage(_ sender: Any) {
    }
    
    func displayImg(imgURL: String?) {
        self.layer.cornerRadius = self.frame.size.width/2
        self.teamImg.sd_setBackgroundImage(with: URL(string: imgURL!), for: .normal)
    }

    func navigateWithTeamData(team: Team) {
        
    }
}

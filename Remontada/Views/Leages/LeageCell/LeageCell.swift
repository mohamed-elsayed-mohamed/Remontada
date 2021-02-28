//
//  LeageCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

class LeageCell: UITableViewCell, LeageCellProtocol {
    
    @IBOutlet weak var leageImg: UIImageView!
    @IBOutlet weak var leageName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func leageVideo(_ sender: Any) {

    }
    
    func displayName(name: String) {
        self.leageName.text = name
    }
    
    func displayImage(image: String) {
        self.leageImg.layer.cornerRadius = self.leageImg.frame.size.width/2
        self.leageImg.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

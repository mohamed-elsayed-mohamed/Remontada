//
//  SportCell.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit
import SDWebImage

class SportCell: UICollectionViewCell, SportCellProtocol {
    
    @IBOutlet weak var sportImg: UIImageView!
    @IBOutlet weak var sportName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayImage(image: String) {
        self.sportImg.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func displayName(name: String) {
        self.sportName.text = name
    }


}

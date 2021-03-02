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
    @IBOutlet weak var btnYouTube: UIButton!
    private var youtubeURL: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func leageVideo(_ sender: Any) {
        let currentView: UIViewController = self.window!.rootViewController!
        
        let youtubeView = currentView.storyboard!.instantiateViewController(withIdentifier: ViewsIDs.youtube) as! YoutubeVC
        
        youtubeView.setVideoID(videoID: youtubeURL!)
        let navController = UINavigationController(rootViewController: youtubeView)
        currentView.present(navController, animated:true, completion: nil)
    }
    
    func displayName(name: String) {
        self.leageName.text = name
    }
    
    func displayImage(image: String) {
        self.leageImg.layer.cornerRadius = self.leageImg.frame.size.width/2
        self.leageImg.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func setVideoID(youtubeVideoID: String?) {
        self.btnYouTube.isHidden = false
        self.youtubeURL = youtubeVideoID
    }
}

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
        
        if(BaseAPI().isConnectedToInternet()){
            let youtubeView = currentView.storyboard!.instantiateViewController(withIdentifier: ViewsIDs.youtube) as! YoutubeVC
            
            youtubeView.setVideoID(videoID: youtubeURL!)
            let navController = UINavigationController(rootViewController: youtubeView)
            currentView.present(navController, animated:true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Can not load leage video!", message: "It seems that you are not connected with the internet please reconnect and try again later!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            currentView.present(alert, animated: true, completion: nil)
        }
    }
    
    func displayName(name: String) {
        self.leageName.text = name
    }
    
    func displayImage(image: String?) {
        self.leageImg.layer.cornerRadius = self.leageImg.frame.size.width/2
        self.leageImg.layer.borderWidth = 2
        self.leageImg.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.30)
        if(image != nil){
            self.leageImg.sd_setImage(with: URL(string: image!), placeholderImage: UIImage(named: "leagues.png"))
        }else{
            self.leageImg.image = UIImage(named: "leagues.png")
        }
    }
    
    func setVideoID(youtubeVideoID: String?) {
        if(youtubeVideoID != nil){
            self.btnYouTube.isHidden = false
            self.youtubeURL = youtubeVideoID
        }else{
            self.btnYouTube.isHidden = true
        }
    }
}

//
//  YoutubeVC.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit
import YouTubePlayer

class YoutubeVC: UIViewController {

    @IBOutlet var youtubePlayer: YouTubePlayerView!
    
    private var videoID: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubePlayer.loadVideoID(self.videoID!)
    }
    
    func setVideoID(videoID: String) {
        self.videoID = videoID
    }
}

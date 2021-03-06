//
//  LeagesPresenter.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation
import UIKit

class LeagesPresenter: CollectionsProtocol {
    
    private weak var leagesView: APIProtocol!
    private let dataAPISource = BaseAPI()
    internal var leages = [LeageModel]()
    
    internal var dataModel: DataModel?
    
    init(leagesView: APIProtocol) {
        self.leagesView = leagesView
        self.dataModel = DataModel()
    }
    
    func getLeages(sportName: String) {
        leagesView?.showIndicator()
        dataAPISource.fetchData(url: APIURLs.leagues, responseClass: LeagesBase.self, completion: { (response) in
            switch response {
            case .success(let leagesBaseInfo):
                guard let leagesBaseInfo = leagesBaseInfo else { return }
                for index in 0..<leagesBaseInfo.leagues!.count{
                    if(leagesBaseInfo.leagues![index].sportName == sportName){
                        let leage: LeageModel! = LeageModel()
                        leage.info = leagesBaseInfo.leagues![index]
                        self.leages.append(leage)
                    }
                }
                self.getMoreInfo()
                
            case .failure(let error):
                let errorMessage = error.userInfo[NSLocalizedDescriptionKey]! as! String
                if error.code == -1 {
                    self.leagesView?.showInternetMessage(message: errorMessage)
                }else{
                    self.leagesView?.showError(error: errorMessage)
                }
            }
        })
    }
    
    private func getMoreInfo(){
        for index in 0..<self.leages.count{
            dataAPISource.fetchData(url: APIURLs.leageWithID + leages[index].info.ID!, responseClass: LeagesMore.self, completion: {
                (response) in
                switch response {
                case .success(let moreInfo):
                    guard let moreInfo = moreInfo?.leagues else { return }
                    self.leages[index].moreInfo = moreInfo[0]
                    
                    //self.getYouTubeID(youTubeURL: moreInfo[0].youtube, index: index)
                    
                    
                    
                    if(index == self.leages.count-1){
                        self.getYouTubeIDs()
                        //self.leagesView?.fetchingDataSuccess()
                        //self.leagesView?.hideIndicator()
                    }
                    
                case .failure(let error):
                    let errorMessage = error.userInfo[NSLocalizedDescriptionKey]! as! String
                    if error.code == -1 {
                        self.leagesView?.showInternetMessage(message: errorMessage)
                    }else{
                        self.leagesView?.showError(error: errorMessage)
                    }
                }
            })
        }
    }
    
    private func getYouTubeIDs(){
        for index in 0..<self.leages.count{
            let youTubeURL = self.leages[index].moreInfo.youtube
        if(youTubeURL != nil && (youTubeURL!.contains("user") || youTubeURL!.contains("channel"))){
            var url: String!
            if(youTubeURL!.contains("user")){
                url = APIURLs.youtubeAPIWithUsername + youTubeURL!.split(separator: "/").last! + APIURLs.youtubeAPIKey
            }
            else if(youTubeURL!.contains("channel")){
                url = APIURLs.youtubeAPIWithID + youTubeURL!.split(separator: "/").last! + APIURLs.youtubeAPIKey
            }

            dataAPISource.fetchData(url: url!, responseClass: YouTubeModel.self, completion: {
                (response) in
                switch response {
                case .success(let youtubeData):
                    guard let youtubeData = youtubeData else { return }
                    self.leages[index].youTubeID = youtubeData.items[0]!.brandingSettings.channel.unsubscribedTrailer
                    
                case .failure:
                    self.leages[index].youTubeID = nil
                }
            })
        }
        
        
        if(index == self.leages.count-1){
            self.leagesView?.hideIndicator()
            self.leagesView?.fetchingDataSuccess()
        }
        
    }
    }
    
    func getCellsCount() -> Int {
        return leages.count
    }
    
    func insertCell(cell: LeageCell, index: Int) {
        let leage: LeageModel = leages[index]
        cell.displayName(name: leage.info.name!)
        cell.displayImage(image: leage.moreInfo.imageURL)
        cell.setVideoID(youtubeVideoID: leage.youTubeID)
    }
    
    func selectCell(index: Int) {}
    
    func getLeagueID(index: Int) -> String{
        return leages[index].info.ID!
    }
    
    func getLeagueName(index: Int) -> String {
        return leages[index].info.name!
    }
}

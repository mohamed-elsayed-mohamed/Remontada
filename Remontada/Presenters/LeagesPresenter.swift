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
    private var leages = [LeageModel]()
    
    init(leagesView: APIProtocol, sportName: String) {
        self.leagesView = leagesView
        getLeages(sportName: sportName)
    }
    
    private func getLeages(sportName: String) {
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
                
            case .failure:
                self.leagesView?.showError(error: "Error While featching base info data")
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
                    self.getYouTubeID(youTubeURL: moreInfo[0].youtube!, index: index)

                case .failure:
                    self.leagesView?.showError(error: "Error While featching more info data")
                }
            })
        }
    }
    
    func getCellsCount() -> Int {
        return leages.count
    }
    
    func insertCell(cell: LeageCell, index: Int) {
        let leage: LeageModel = leages[index]
        cell.displayName(name: leage.info.name!)
        if(leage.moreInfo != nil && leage.moreInfo.imageURL != nil){
            cell.displayImage(image: leage.moreInfo.imageURL!)
        }
        if(leage.youTubeID != nil){
            //print(leage.youTubeID!)
            cell.setVideoID(youtubeVideoID: leage.youTubeID!)
        }else{
            //print(leage.info.name!)
        }
    }
    
    func selectCell(index: Int) {}
    
    func getLeagueID(index: Int) -> String{
        return leages[index].info.ID!
    }
    
    private func getYouTubeID(youTubeURL: String?, index: Int){
        var url: String!
        if(youTubeURL != nil && (youTubeURL!.contains("user") || youTubeURL!.contains("channel"))){
            if(youTubeURL!.contains("user")){
                url = APIURLs.youtubeAPIWithUsername
                let username = youTubeURL!.split(separator: "/").last
                url += username!
                url += APIURLs.youtubeAPIKey
            }
            else if(youTubeURL!.contains("channel")){
                url = APIURLs.youtubeAPIWithID
                let id = youTubeURL!.split(separator: "/").last
                url += id!
                url += APIURLs.youtubeAPIKey
            }
            dataAPISource.fetchData(url: url!, responseClass: YouTubeModel.self, completion: {
                (response) in
                switch response {
                case .success(let youtubeData):
                    guard let youtubeData = youtubeData else { return }
                    self.leages[index].youTubeID = youtubeData.items[0]!.brandingSettings.channel.unsubscribedTrailer
                    
                case .failure:
                    self.leages[index].youTubeID = nil
                    self.leagesView?.showError(error: "Error While featching YouTubeInfo data")
                }
                
                if(index == self.leages.count-1){
                    self.leagesView?.fetchingDataSuccess()
                    self.leagesView?.hideIndicator()
                }
            })
        }else{
            if(index == self.leages.count-1){
                self.leagesView?.fetchingDataSuccess()
                self.leagesView?.hideIndicator()
            }
        }
    }
}

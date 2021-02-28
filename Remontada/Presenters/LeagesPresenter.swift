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
    
    private func getMoreInfo(/*ID: String, of Index: Int*/){
        for index in 0..<self.leages.count{
            dataAPISource.fetchData(url: APIURLs.leageWithID + leages[index].info.ID!, responseClass: LeagesMore.self, completion: {
                (response) in
                switch response {
                case .success(let moreInfo):
                    guard let moreInfo = moreInfo?.leagues else { return }
                    self.leages[index].moreInfo = moreInfo[0]                    //print(moreInfo[0].imageURL)
                    if(index == self.leages.count-1){
                        self.leagesView?.fetchingDataSuccess()
                        self.leagesView?.hideIndicator()
                    }
                    
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
    }
    
    func selectCell(index: Int) {}
    
    func getLeagueID(index: Int) -> String{
        return leages[index].info.ID!
    }
}

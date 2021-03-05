//
//  LeagesPresenter+CoreDataPresenter.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 03/03/2021.
//

import Foundation

extension LeagesPresenter{
    func deleteByID(leagueID: String?) -> Int {
        self.dataModel!.deleteLeague(leagueID: leagueID!)
    }
    
    func isFavorite(leagueID: String?) -> Bool {
        if(self.dataModel!.getLeagueByID(ID: DetailsVC.leagueID!) != nil){
            return true
        }
        return false
    }
    
    func addFavorite(index: Int) -> Int {
        
        let res = self.dataModel!.addLeague(id: self.leages[index].info.ID!, name: self.leages[index].info.name!, badgeURL: self.leages[index].moreInfo.imageURL, youtubeURL: self.leages[index].youTubeID)
        
        return res
    }
}

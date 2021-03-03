//
//  FavoriteLeaguesPresenter.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 03/03/2021.
//

import Foundation

class FavoriteLeaguesPresenter: CollectionsProtocol{
    
    private var coreDataModel: DataModel
    private weak var favoriteLeagesView: CoreDataProtocol!
    private var favoriteLeages: [FavoriteLeagues]?
    
    init(favoriteLeagesView: CoreDataProtocol) {
        self.favoriteLeagesView = favoriteLeagesView
        
        self.coreDataModel = DataModel()
    }
    
    func getAllFavorite() {
        self.favoriteLeages = self.coreDataModel.getLeages()!
        if(favoriteLeages == nil){
            favoriteLeagesView.showMessage(message: "Error while featching data")
        }else if(favoriteLeages!.count == 0){
            favoriteLeagesView.showMessage(message: "No Favorite Leagues")
        }else{
            favoriteLeagesView.fetchingDataSuccess()
        }
    }
    
    
    func getCellsCount() -> Int {
        return favoriteLeages!.count
    }
    
    func getLeagueID(index: Int) -> String{
        return favoriteLeages![index].id!
    }
    
    func selectCell(index: Int) {
        
    }
    
    func insertCell(cell: LeageCell, index: Int) {
        let favorite: FavoriteLeagues = favoriteLeages![index]
        cell.displayName(name: favorite.name!)
        if(favorite.badgeURL != nil){
            cell.displayImage(image: favorite.badgeURL!)
        }
        
        if(favorite.youtubeURL != nil){
            cell.setVideoID(youtubeVideoID: favorite.youtubeURL!)
        }
    }
    
}

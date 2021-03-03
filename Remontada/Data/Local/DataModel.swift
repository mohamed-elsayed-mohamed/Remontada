//
//  DataModel.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 03/03/2021.
//

import UIKit
import CoreData

class DataModel {
    
    private let context: NSManagedObjectContext
    private var favoriteLeages: [FavoriteLeagues]?
    
    init() {
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        favoriteLeages = [FavoriteLeagues]()
    }
    
    func getLeages() -> [FavoriteLeagues]? {
        do{
            self.favoriteLeages = try context.fetch(FavoriteLeagues.fetchRequest())
        }catch {
            return nil
        }
        
        return self.favoriteLeages
    }
    
    func getLeagueByID(ID: String) -> FavoriteLeagues? {
        do{
            let request = FavoriteLeagues.fetchRequest() as NSFetchRequest<FavoriteLeagues>
            let predicate = NSPredicate(format: "id CONTAINS %@", ID)
            
            request.predicate = predicate
            self.favoriteLeages = try context.fetch(request)
        }catch {
            return nil
        }
        
        if(self.favoriteLeages!.count == 0){
            return nil
        }
        
        return self.favoriteLeages![0]
    }
    
    func addLeague(id: String?, name: String?, badgeURL: String?, youtubeURL: String?) -> Int {
        let newFavLeague = FavoriteLeagues(context: self.context)
        newFavLeague.id = id
        newFavLeague.name = name
        newFavLeague.badgeURL = badgeURL
        newFavLeague.youtubeURL = youtubeURL
        do{
            try self.context.save()
            return 1
        }catch{
            return 0
        }
    }
    
    func deleteLeague(leagueID: String) -> Int {
        let deletedLeague = self.getLeagueByID(ID: leagueID)
        if(deletedLeague != nil){
            do{
                self.context.delete(deletedLeague!)
                try self.context.save()
                return 1
            }catch{
                return 0
            }
        }
        
        return 0
    }
    
}

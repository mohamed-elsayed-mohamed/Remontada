//
//  FavoriteLeagues+CoreDataProperties.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 03/03/2021.
//
//

import Foundation
import CoreData


extension FavoriteLeagues {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteLeagues> {
        return NSFetchRequest<FavoriteLeagues>(entityName: "FavoriteLeagues")
    }

    @NSManaged public var badgeURL: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var youtubeURL: String?

}

extension FavoriteLeagues : Identifiable {

}

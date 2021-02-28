//
//  Sport.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation

class Sport: Decodable {
    public var name: String?
    public var imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "strSport"
        case imageURL = "strSportThumb"
    }
}

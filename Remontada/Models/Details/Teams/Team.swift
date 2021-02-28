//
//  Team.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import Foundation

class Team: Decodable {
    var ID: String?
    var name: String?
    var league: String?
    var stadiumImgURL: String?
    var website: String?
    var facebook: String?
    var twitter: String?
    var instagram: String?
    var country: String?
    var imgURL: String?
    var eventImgUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case ID = "idTeam"
        case name = "strTeam"
        case league = "strLeague"
        case stadiumImgURL = "strStadiumThumb"
        case website = "strWebsite"
        case facebook = "strFacebook"
        case twitter = "strTwitter"
        case instagram = "strInstagram"
        case country = "strCountry"
        case imgURL = "strTeamBadge"
    }
}

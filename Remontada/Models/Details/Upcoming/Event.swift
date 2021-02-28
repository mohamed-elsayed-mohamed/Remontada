//
//  Event.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

class Event: Decodable {
    var ID: String?
    var teamA: String?
    var teamB: String?
    var teamAScore: String?
    var teamBScore: String?
    var date: String?
    var time: String?
    var teamAID: String?
    var teamBID: String?
    var eventImgURL: String?
    
    enum CodingKeys: String, CodingKey {
        case ID = "idEvent"
        case teamA = "strHomeTeam"
        case teamB = "strAwayTeam"
        case teamAScore = "intHomeScore"
        case teamBScore = "intAwayScore"
        case date = "dateEventLocal"
        case time = "strTimeLocal"
        case teamAID = "idHomeTeam"
        case teamBID = "idAwayTeam"
        case eventImgURL = "strThumb"
    }

}

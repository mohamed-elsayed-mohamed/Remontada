//
//  Constants.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation

enum APIURLs{
    static let sports = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    static let leagues = "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php"
    static let leageWithID = "https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id="
    static let eventsByLeagueID = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    static let teamByID = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id="
    static let teamsInLeagueID = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="
    
    static let youtubeAPIWithID = "https://youtube.googleapis.com/youtube/v3/channels?part=brandingSettings&part=contentDetails&part=contentOwnerDetails&part=id&part=localizations&part=snippet&part=statistics&part=status&part=topicDetails&id="
    static let youtubeAPIWithUsername = "https://youtube.googleapis.com/youtube/v3/channels?part=brandingSettings&part=contentDetails&part=contentOwnerDetails&part=id&part=localizations&part=snippet&part=statistics&part=status&part=topicDetails&forUsername="
    static let youtubeAPIKey = "&key=AIzaSyAhbFg1NXjD8gcHwO7o83nVz81pH4HwCAY"
}

//
//  YouTubeModel.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 28/02/2021.
//

import Foundation

class YouTubeModel: Decodable {
    var items: [Item?]
}

class Item: Decodable{
    var brandingSettings: Settings
}

class Settings: Decodable {
    var channel: Channel
}

class Channel: Decodable {
    var unsubscribedTrailer: String
}

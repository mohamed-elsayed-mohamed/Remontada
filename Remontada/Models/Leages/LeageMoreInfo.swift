//
//  LeageMoreInfo.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

class LeageMoreInfo: Decodable {
    public var imageURL: String?
    public var website: String?
    public var facebook: String?
    public var twitter: String?
    public var youtube: String?
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "strBadge"
        case website = "strWebsite"
        case facebook = "strFacebook"
        case twitter = "strTwitter"
        case youtube = "strYoutube"
    }
}

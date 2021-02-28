//
//  LeageModel.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

class LeageBaseInfo: Decodable {
    public var ID: String?
    public var name: String?
    public var sportName: String?
    
    enum CodingKeys: String, CodingKey {
        case ID = "idLeague"
        case name = "strLeague"
        case sportName = "strSport"
    }
}

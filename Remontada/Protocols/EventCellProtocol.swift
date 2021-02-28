//
//  EventCellProtocol.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

protocol EventCellProtocol {
    func displayImgs(teamAURL: String?, teamBURL: String?)
    func displayNames(teamA: String, teamB: String)
    func displayDateTime(date: String?, time: String?)
    func displayResults(teamARes: String?, teamBRes: String?)
}

//
//  CoreDataProtocol.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 03/03/2021.
//

import Foundation

protocol CoreDataProtocol: class {
    func fetchingDataSuccess()
    func showMessage(message: String)
    func deleteLeagueFromFavorite(index: Int)
}

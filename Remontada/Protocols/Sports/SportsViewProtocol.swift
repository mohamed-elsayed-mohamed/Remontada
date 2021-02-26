//
//  SportsViewProtocol.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation

protocol SportsViewProtocol: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
}

//
//  SportsViewProtocol.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation

protocol APIProtocol: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func showInternetMessage(message: String)
}

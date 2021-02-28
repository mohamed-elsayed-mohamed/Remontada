//
//  CollectionsProtocol.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import UIKit

protocol CollectionsProtocol {
    func getCellsCount() -> Int
    // func insertCell<T: NSObject>(cell: T.Type, index: Int)
    func selectCell(index: Int)
}

//
//  Sports.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation
import UIKit

class SportsPresenter: CollectionsProtocol {
    
    private weak var sportsView: APIProtocol?
    private let dataAPISource = BaseAPI()
    private var sports = [Sport]()
    private var selectedSport: Sport?
    
    init(sportsView: APIProtocol) {
        self.sportsView = sportsView    // Call: self.sportsView = self
        getSports()
    }
    
    private func getSports() {
        sportsView?.showIndicator()
        dataAPISource.fetchData(url: APIURLs.sports, responseClass: SportsModel.self, completion: { (response) in
            switch response {
            case .success(let sports):
                guard let sports = sports?.sports else { return }
                self.sports = sports
                
                self.sportsView?.fetchingDataSuccess()
                self.sportsView?.hideIndicator()
            case .failure:
                self.sportsView?.showError(error: "Error While featching data")
            }
        })
    }
    
    func getCellsCount() -> Int {
        return sports.count
    }
    
    func insertCell(cell: SportCell, index: Int) {
        let sport: Sport = sports[index]
        cell.displayName(name: sport.name!)
        cell.displayImage(image: sport.imageURL!)
    }
    
    func selectCell(index: Int) {
        selectedSport = sports[index]
    }
    
    func getSelectedSport() -> Sport {
        return selectedSport!
    }
    
}

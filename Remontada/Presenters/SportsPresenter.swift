//
//  Sports.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation

class SportsPresenter {
    private weak var sportsView: SportsViewProtocol?
    private let dataCollector = BaseAPI()
    private var sports = [Sport]()
    
    init(sportsView: SportsViewProtocol) {
        self.sportsView = sportsView    // Call: self.sportsView = self
        getSports()
    }
    
    private func getSports() {
        sportsView?.showIndicator()
        dataCollector.fetchData(url: APIURLs.sports, responseClass: SportsModel.self, completion: { (response) in
            switch response {
            case .success(let sports):
                guard let sports = sports?.sports else { return }
                self.sports = sports
                //for sport in sports {
                  // print("name -> \(sport.name!) Image URL -> \(sport.imageURL!)")
               // }
                self.sportsView?.fetchingDataSuccess()
                self.sportsView?.hideIndicator()
            case .failure:
                self.sportsView?.showError(error: "Error While featching data")
            }
        })
    }
    
    func getSportsCount() -> Int{
        return sports.count
    }
    
    func inserCell(cell: SportCell, for index: Int) {
        let sport: Sport = sports[index]
        cell.displayName(name: sport.name!)
        cell.displayImage(image: sport.imageURL!)
    }
    
}

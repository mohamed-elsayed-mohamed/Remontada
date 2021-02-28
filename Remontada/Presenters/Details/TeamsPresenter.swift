//
//  TeamsPresenter.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//

import UIKit

class TeamsPresenter: CollectionsProtocol {
    
    private weak var teamsView: APIProtocol?
    private let dataAPISource = BaseAPI()
    private var teams = [TeamsModel]()
    
    init(teamsView: APIProtocol, leagueID: String) {
        self.teamsView = teamsView
        getTeams(leagueID: leagueID)
    }
    
    func getTeams(leagueID: String) {
        dataAPISource.fetchData(url: APIURLs.teamsInLeagueID + leagueID, responseClass: TeamsModel.self, completion: { (response) in
            self.teamsView?.showIndicator()
            switch response {
            case .success(let teams):
                guard let teams = teams else { return }
                self.teams.append(teams)
                self.teamsView?.hideIndicator()
                self.teamsView?.fetchingDataSuccess()
            case .failure:
                self.teamsView?.showError(error: "Error While featching data")
            }
        })
    }
    
    func getCellsCount() -> Int {
        if(teams.count>0){
            return self.teams[0].teams.count
        }
        else{
            return 0
        }
    }
    
    func insertCell(cell: TeamCell, index: Int) {
        let team: Team = self.teams[0].teams[index]!
        cell.displayImg(imgURL: team.imgURL)
    }
    
    func selectCell(index: Int) {
        
    }
}

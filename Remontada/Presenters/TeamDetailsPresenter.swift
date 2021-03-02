//
//  TeamDetailsPresenter.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 01/03/2021.
//

import Foundation

class TeamDetailsPresenter {
    
    private weak var teamDetailsView: APIProtocol?
    private let dataAPISource = BaseAPI()
    private var team = Team()
    
    init(teamDetailsView: APIProtocol, teamID: String) {
        self.teamDetailsView = teamDetailsView
        getTeamData(teamID: teamID)
    }
    
    private func getTeamData(teamID: String) {
        self.teamDetailsView?.showIndicator()
        dataAPISource.fetchData(url: APIURLs.teamByID + teamID, responseClass: TeamsModel.self, completion: { (response) in
            switch response {
            case .success(let teams):
                guard let teams = teams else { return }
                self.team = teams.teams[0]!
                self.teamDetailsView?.hideIndicator()
                self.teamDetailsView?.fetchingDataSuccess()
            case .failure:
                self.teamDetailsView?.showError(error: "Error")
            }
        })
    }
    
    
    func getTeamDetails() -> Team {
        return self.team
    }

}

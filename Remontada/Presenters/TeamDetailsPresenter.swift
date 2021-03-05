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
    
    init(teamDetailsView: APIProtocol) {
        self.teamDetailsView = teamDetailsView
    }
    
    func getTeamData(teamID: String) {
        self.teamDetailsView?.showIndicator()
        dataAPISource.fetchData(url: APIURLs.teamByID + teamID, responseClass: TeamsModel.self, completion: { (response) in
            switch response {
            case .success(let teams):
                guard let teams = teams else { return }
                self.team = teams.teams[0]!
                self.teamDetailsView?.hideIndicator()
                self.teamDetailsView?.fetchingDataSuccess()
            case .failure(let error):
                let errorMessage = error.userInfo[NSLocalizedDescriptionKey]! as! String
                if error.code == -1 {
                    self.teamDetailsView?.showInternetMessage(message: errorMessage)
                }else{
                    self.teamDetailsView?.showError(error: errorMessage)
                }
            }
        })
    }
    
    
    func getTeamDetails() -> Team {
        return self.team
    }

}

//
//  LastEventsPresenter.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 27/02/2021.
//
import Foundation

class LastEventsPresenter: CollectionsProtocol {
    
    private weak var upcommingView: APIProtocol?
    private let dataAPISource = BaseAPI()
    private var upcomingEvents = [UpcomingModel]()
    
    
    init(upcommingView: APIProtocol) {
        self.upcommingView = upcommingView
    }
    
    func getEvents(leageID: String) {
        upcommingView?.showIndicator()
        dataAPISource.fetchData(url: APIURLs.eventsByLeagueID + leageID, responseClass: Events.self, completion: { (response) in
            switch response {
            case .success(let allEvents):
                guard let allEvents = allEvents else { return }
                
                for event in allEvents.events{
                    let upcomingEvent: UpcomingModel = UpcomingModel()
                    upcomingEvent.event = event
                    self.upcomingEvents.append(upcomingEvent)
                }
                
                self.getTeamsInfo()
            case .failure(let error):
                let errorMessage = error.userInfo[NSLocalizedDescriptionKey]! as! String
                if error.code == -1 {
                    self.upcommingView?.showInternetMessage(message: errorMessage)
                }else{
                    self.upcommingView?.showError(error: errorMessage)
                }
            }
        })
    }
    
    func getTeamsInfo() {
        for eventIndex in 0..<self.upcomingEvents.count {
            let event = self.upcomingEvents[eventIndex]
            for index in 0..<2 {
                if(event.event?.teamBID == nil){
                    break
                }
                var teamID: String?
                if(index == 0){
                    teamID = event.event?.teamAID
                }else{
                    teamID = event.event?.teamBID
                }
                dataAPISource.fetchData(url: APIURLs.teamByID + teamID!, responseClass: TeamsModel.self, completion: { (response) in
                    switch response {
                    case .success(let teams):
                        guard let teams = teams else { return }
                        let team: Team = teams.teams[0]!
                        if(index == 0){
                            event.teamA = team
                        }else{
                            event.teamB = team
                        }
                        
                        if(eventIndex == self.upcomingEvents.count - 1){
                            self.upcommingView?.hideIndicator()
                            self.upcommingView?.fetchingDataSuccess()
                        }
                    case .failure:
                        self.upcommingView?.showError(error: "Error While featching base info data")
                    }
                })
            }
        }
    }
    
    
    
    func getCellsCount() -> Int {
        return upcomingEvents.count
    }
    
    func inserCell(cell: EventCell, index: Int) {
        let lastEvent: UpcomingModel = upcomingEvents[index]
        cell.displayNames(teamA: lastEvent.event!.teamA!, teamB: lastEvent.event!.teamB!)
        cell.displayDateTime(date: lastEvent.event!.date, time: lastEvent.event!.time)
        cell.displayResults(teamARes: lastEvent.event!.teamAScore, teamBRes: lastEvent.event!.teamBScore)
        
        if(lastEvent.teamA != nil && lastEvent.teamB != nil){
            cell.displayImgs(teamAURL: lastEvent.teamA!.imgURL!, teamBURL: lastEvent.teamB!.imgURL!)
        }else if(lastEvent.teamA == nil && lastEvent.teamB != nil){
            cell.displayImgs(teamAURL: nil, teamBURL: lastEvent.teamB!.imgURL!)
        }else if(lastEvent.teamA != nil && lastEvent.teamB == nil){
            cell.displayImgs(teamAURL: lastEvent.teamA!.imgURL!, teamBURL: nil)
        }else{
            cell.displayImgs(teamAURL: nil, teamBURL: nil)
        }
    }
    
    func selectCell(index: Int) {
    }
}

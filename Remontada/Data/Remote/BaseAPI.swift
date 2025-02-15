//
//  BaseAPI.swift
//  Remontada
//
//  Created by Mohamed Elsayed on 26/02/2021.
//

import Foundation
import Alamofire

class BaseAPI {
    
    func fetchData<T: Decodable>(url: String, responseClass: T.Type , completion:@escaping (Result<T?, NSError>) -> Void) {
        
        if(!self.isConnectedToInternet()){
            return completion(.failure(NSError(domain: url, code: -1, userInfo: [NSLocalizedDescriptionKey: "No Internet Connection"])))
        }
        
        AF.request(url, method: .get, parameters: [:], headers: [:]).responseJSON {
            (response) in
            guard let statusCode = response.response?.statusCode else { return }
            
            if statusCode == 200 {
                guard let jsonResponse = try? response.result.get() else { return }
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else { return }
                
                guard let responseObj = try? JSONDecoder().decode(T.self, from: theJSONData) else {
                    let error = NSError(domain: url, code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing Error"])
                    completion(.failure(error))
                    return }
                completion(.success(responseObj))
            }else{
                return completion(.failure(NSError(domain: url, code: 0, userInfo: [NSLocalizedDescriptionKey: "Can not reach the data please try again later!"])))
            }
        }
    }
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

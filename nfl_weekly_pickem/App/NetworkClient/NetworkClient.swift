//
//  NetworkClient.swift
//  nfl_weekly_pickem
//
//  Created by Jonathan Cravotta on 9/29/17.
//  Copyright © 2017 Jonathan Cravotta. All rights reserved.
//

import Foundation
import Alamofire

//let JSON = [String:Any]()

enum NetworkResponse {
    case success([String: Any])
    case error
}

class NetworkClient {
    static func makeRequest(completion:@escaping ((NetworkResponse)->())) {
        Alamofire.request("https://serene-garden-30520.herokuapp.com/app/games").responseJSON { (response) in
            guard let value = response.value, let json = value as? [String: Any] else { return completion(.error) }
            
            return completion(.success(json))
        }
    }
}

//
//  NetworkAdapter.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation

final class NetworkAdapter {
    static var shared = NetworkAdapter()
    
    private init() { }
    
    lazy var defaultHeader: [String: String] = [
        "user_id": UserManager.shared.retrieveUserInfo().userID,
        "password": UserManager.shared.retrieveUserInfo().password
    ]
    
    var baseURL = "http://34.64.187.145:8080"
}

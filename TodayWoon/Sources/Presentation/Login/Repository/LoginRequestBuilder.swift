//
//  LoginRequestBuilder.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation

import Alamofire

//struct User: Decodable {
//    let userID: String
//    let password: String
//    
//    enum CodingKeys: String, CodingKey {
//        case userID = "user_id"
//        case password
//    }
//}

final class LoginRequestBuilder: CoreRequestBuilder {
    typealias ResponseType = UserInfo
    
    var method: HTTPMethod = .get
    var baseURL: String = ""
    var path: String = ""
    var additionalHeader: AdditionalHeader?
    var parameters: Parameters? = nil
    
    init(userID: String, password: String) {
        additionalHeader = ["user_id": userID, "password": password]
    }
}

//
//  LoginRequestBuilder.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import Foundation
import Alamofire

struct UserInfo: Decodable {
    var response: Response
    
    struct Response: Decodable {
        let userID: String
        
        enum CodingKeys: String, CodingKey {
            case userID = "user_id"
        }
    }
}

final class SignUpRequestBuilder: CoreRequestBuilder {
    typealias ResponseType = UserInfo
    
    var method: HTTPMethod = .post
    var baseURL: String = ""
    var path: String = ""
    var parameters: Parameters?
    
    init(parameters: Parameter) {
        self.parameters = parameters.value
    }
}

extension SignUpRequestBuilder {
    struct Parameter {
        let userID: String
        let password: String
        
        init(userID: String, password: String) {
            self.userID = userID
            self.password = password
        }
        
        var value: Parameters {
            [
                "user_id": userID,
                "password": password
            ]
        }
    }
}

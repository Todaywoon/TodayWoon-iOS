//
//  LoginRepository.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import Foundation
import Combine

final class LoginRepisotry {
    
}

extension LoginRepisotry {
    func requestLogin(userID: String, password: String) -> AnyPublisher<UserInfo, Error> {
        let jsonString = """
             {
                 "response": {
                    "user_id": "하하하하하"
                }
             }
             """
        
        return LoginRequestBuilder(parameters: LoginRequestBuilder.Parameter(userID: userID, password: password)).mockRequest(from: jsonString)
    }
}

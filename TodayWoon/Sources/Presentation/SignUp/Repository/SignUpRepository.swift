//
//  SignUpRepository.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation
import Combine

final class SignUpRepository {
    
}

extension SignUpRepository {
    func requestSignUp(userID: String, password: String) -> AnyPublisher<UserInfo, Error> {
        let jsonString = """
             {
                 "response": {
                    "user_id": "하하하하하"
                }
             }
             """
        
        return SignUpRequestBuilder(parameters: SignUpRequestBuilder.Parameter(userID: userID, password: password)).mockRequest(from: jsonString)
    }
}

//
//  DataModel.swift
//  TodayWoon
//
//  Created by 백유정 on 6/2/24.
//

import Foundation
/*
 {
   "response": {
     "userId": "asdf"
   }
 }
 */

struct APIResponse {
    let response: UserId
}

struct UserId {
    let userId: String
}

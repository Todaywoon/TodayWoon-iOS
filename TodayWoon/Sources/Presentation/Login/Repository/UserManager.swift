//
//  UserManager.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation

final class UserManager {
    static var shared = UserManager()
    
    private init() { }
    
    func saveUserInfo(userID: String, password: String) {
        UserDefaults.standard.setValue(userID, forKey: UserDefaultKeys.userID)
        UserDefaults.standard.setValue(password, forKey: UserDefaultKeys.password)
    }
    
    func retrieveUserInfo() -> (userID: String, password: String) {
        let userID = UserDefaults.standard.string(forKey: UserDefaultKeys.userID) ?? ""
        let password = UserDefaults.standard.string(forKey: UserDefaultKeys.password) ?? ""
        
        return (userID, password)
    }
}

extension UserManager {
    enum UserDefaultKeys {
        static let userID: String = "userID"
        static let password: String = "password"
    }
}

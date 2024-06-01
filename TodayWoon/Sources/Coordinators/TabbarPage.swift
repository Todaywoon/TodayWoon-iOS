//
//  TabbarPage.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import Foundation

import Foundation

enum TabbarPage {
    case home
    case feed
    case profile

    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .feed
        case 2:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"
        case .feed:
            return "Feed"
        case .profile:
            return "Profile"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .feed:
            return 1
        case .profile:
            return 2
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}

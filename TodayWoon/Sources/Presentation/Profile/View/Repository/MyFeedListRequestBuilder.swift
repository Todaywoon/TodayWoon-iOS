//
//  MyFeedListRequestBuilder.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation
import Alamofire

struct MyFeedInfo: Decodable {
    let total: Int
    let feeds: [Feed]
    
    enum CodingKeys: String, CodingKey {
        case total
        case feeds = "response"
    }
}

struct Feed: Decodable {
    let feedID: Int
    let pictureURL: String
    let likeCount: Int
    let userID: String
    let startTime: String
    let finishTime: String
    let duration: Int
    
    enum CodingKeys: String, CodingKey {
        case feedID = "feed_id"
        case pictureURL = "picture_url"
        case likeCount = "like_count"
        case userID = "user_id"
        case startTime = "start_time"
        case finishTime = "finish_time"
        case duration = "duration"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.feedID = try container.decode(Int.self, forKey: .feedID)
        self.pictureURL = try container.decode(String.self, forKey: .pictureURL)
        self.likeCount = try container.decode(Int.self, forKey: .likeCount)
        self.userID = try container.decode(String.self, forKey: .userID)
        self.startTime = try container.decode(String.self, forKey: .startTime)
        self.finishTime = try container.decode(String.self, forKey: .finishTime)
        self.duration = try container.decode(Int.self, forKey: .duration)
    }
}

class MyFeedListRequestBuilder: CoreRequestBuilder {
    var header: Alamofire.HTTPHeaders? {
        .default
    }
    
    typealias ResponseType = MyFeedInfo
    
    var method: HTTPMethod = .get
    var baseURL: String = ""
    var path: String = "/myfeeds"
    var parameters: Parameters?
    var additionalHeader: AdditionalHeader?
    
    init() {
        additionalHeader = NetworkAdapter.shared.defaultHeader
    }
    
}

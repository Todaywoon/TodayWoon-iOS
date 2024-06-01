//
//  ProfileRepository.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation
import Combine

final class ProfileRepository {
    func requestMyFeeds() -> AnyPublisher<MyFeedInfo, Error> {
        let jsonString = """
             {
               "total": 1,
               "response": [
                 {
                   "feed_id": 1,
                   "user_id": "string",
                   "start_time": "string",
                   "finish_time": "string",
                   "duration": 0,
                   "picture_url": "string",
                   "like_count": 3
                 },
                              {
                                "feed_id": 1,
                                "user_id": "string",
                                "start_time": "string",
                                "finish_time": "string",
                                "duration": 0,
                                "picture_url": "string",
                                "like_count": 3
                              },
                              {
                                "feed_id": 1,
                                "user_id": "string",
                                "start_time": "string",
                                "finish_time": "string",
                                "duration": 0,
                                "picture_url": "string",
                                "like_count": 3
                              },
                              {
                                "feed_id": 1,
                                "user_id": "string",
                                "start_time": "string",
                                "finish_time": "string",
                                "duration": 0,
                                "picture_url": "string",
                                "like_count": 3
                              },
                              {
                                "feed_id": 1,
                                "user_id": "string",
                                "start_time": "string",
                                "finish_time": "string",
                                "duration": 0,
                                "picture_url": "string",
                                "like_count": 3
                              }
               ]
             }
             """
        
        return MyFeedListRequestBuilder().mockRequest(from: jsonString)
    }
}

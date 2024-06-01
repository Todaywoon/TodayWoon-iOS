//
//  UIControl+Extension.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit
import Combine
import CombineCocoa

extension UIControl {
    var tap: AnyPublisher<Void, Never> {
        controlEventPublisher(for: .touchUpInside)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func controlEventPublisher(for events: UIControl.Event) -> AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: events)
            .eraseToAnyPublisher()
    }
}


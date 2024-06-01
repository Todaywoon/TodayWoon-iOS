//
//  SignUpViewModel.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import Combine

final class SignUpViewModel {
    weak var coordinator: LoginCoordinator?
    
    func completeSignUp() {
        guard let coordinator = coordinator else {
            return
        }
        coordinator.finish()
    }
}

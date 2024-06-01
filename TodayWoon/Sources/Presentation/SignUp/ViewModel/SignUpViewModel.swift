//
//  SignUpViewModel.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import Combine
import CombineExt


final class SignUpViewModel {
    weak var coordinator: LoginCoordinator?
    private let repository = SignUpRepository()
    
    var cancellables = Set<AnyCancellable>()
    
    func requestSignUp(userID: String, password: String) {
        let publisher = repository.requestSignUp(userID: userID, password: password).share().materialize()
        
        publisher.values()
            .sink { [weak self] userInfo in
                print("로그인 성공 > \(userInfo)")
                guard let coordinator = self?.coordinator else {
                    return
                }
                coordinator.finish()
            }
            .store(in: &cancellables)
        
        publisher.failures()
            .sink { error in
                print("error> \(error)")
            }
            .store(in: &cancellables)
    }
    
    func completeSignUp() {
        guard let coordinator = coordinator else {
            return
        }
        coordinator.finish()
    }
}

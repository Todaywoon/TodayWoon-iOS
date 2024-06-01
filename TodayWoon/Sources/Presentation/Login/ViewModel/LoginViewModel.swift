//
//  LoginViewModel.swift
//  UIPractice
//
//  Created by 이숭인 on 5/31/24.
//

import Foundation
import Combine
import CombineExt

final class LoginViewModel {
    weak var coordinator: LoginCoordinator?
    private let repository = LoginRepisotry()
    
    var cancellables = Set<AnyCancellable>()
    
    private let loginErrorSubject = PassthroughSubject<Void, Never>()
    
    var loginErrorPublisher: AnyPublisher<Void, Never> {
        loginErrorSubject.eraseToAnyPublisher()
    }
    
    func requestLogin(userID: String, password: String) {
        let publisher = repository.requestLogin(userID: userID, password: password).share().materialize()
        
        publisher.values()
            .sink { [weak self] userInfo in
                print("userINfo > \(userInfo)")
                self?.coordinator?.finish()
            }
            .store(in: &cancellables)
        
        publisher.failures()
            .sink { [weak self] _ in
                self?.loginErrorSubject.send()
            }
            .store(in: &cancellables)
    }
    
    func didTapBottomButton() {
        coordinator?.finish()
    }
    
    func moveSignUpViewController() {
        coordinator?.moveSignUpViewController()
    }
}

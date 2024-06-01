//
//  LoginViewController.swift
//  UIPractice
//
//  Created by 이숭인 on 5/31/24.
//

import UIKit
import SnapKit
import Then
import Combine
import CombineCocoa

extension LoginViewController {
    enum Event {
        case login
    }
}

class LoginViewController: ViewController<LoginView> {
    var cancellables = Set<AnyCancellable>()
    var viewModel: LoginViewModel

    init(_ viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        bindAction()
        bindViewModel()
    }
    
    deinit {
        print("LoginViewController deinit")
    }
}

//MARK: - bind
extension LoginViewController {
    private func bindViewModel() {
        viewModel.loginErrorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.contentView.displayErrorLabel()
            }
            .store(in: &cancellables)
    }
    
    private func bindAction() {
        contentView.loginButton.tap
            .sink { [weak self] _ in
                self?.viewModel.didTapBottomButton()
//                let userID = self?.contentView.idTextField.text
//                let password = self?.contentView.passwordTextField.text
//                self?.viewModel.requestLogin(userID: userID ?? "",
//                                             password: password ?? "")
            }
            .store(in: &cancellables)
        
        contentView.signUpButton.tap
            .sink { [weak self] _ in
                self?.viewModel.moveSignUpViewController()
            }
            .store(in: &cancellables)
    }
}

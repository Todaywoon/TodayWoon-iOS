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
    }
    
    deinit {
        print("LoginViewController deinit")
    }
}

//MARK: - bind
extension LoginViewController {
    private func bindAction() {
        contentView.loginButton.tap
            .sink { [weak self] _ in
                self?.viewModel.requestLogin()
//                self?.viewModel.didTapBottomButton()
            }
            .store(in: &cancellables)
        
        contentView.signUpButton.tap
            .sink { [weak self] _ in
                self?.viewModel.moveSignUpViewController()
            }
            .store(in: &cancellables)
    }
}

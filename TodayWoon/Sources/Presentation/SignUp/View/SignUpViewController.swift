//
//  SignUpViewController.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit
import SnapKit
import Then
import Combine
import CombineCocoa

final class SignUpViewController: ViewController<SignUpView> {
    var cancellables = Set<AnyCancellable>()
    let viewModel: SignUpViewModel

    let button = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .black
    }
    
    init(_ viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
}

extension SignUpViewController {
    private func bindAction() {
        button.tapPublisher
            .sink { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
            .store(in: &cancellables)
        
        contentView.startButton.tap
            .sink { [weak self] _ in
                self?.viewModel.completeSignUp()
//                let userID = self?.contentView.idTextField.text ?? ""
//                let password = self?.contentView.passwordTextField.text ?? ""
//                self?.viewModel.requestSignUp(userID: userID,
//                                              password: password)
            }
            .store(in: &cancellables)
    }
}

//
//  SignUpView.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit
import Combine
import SnapKit
import Then

class SignUpView: BaseView {
    private(set) var signUpLabel = UILabel().then {
        $0.text = "회원가입"
    }
    
    private let idContainer = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 12
    }
    private(set) var idLabel = UILabel().then {
        $0.text = "아이디"
    }
    private(set) var idTextField = UITextField().then {
        $0.placeholder = "ID"
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 4
        $0.addLeftPadding()
    }
    
    private let passwordContainer = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 12
    }
    private(set) var passwordLabel = UILabel().then {
        $0.text = "비밀번호"
    }
    
    private(set) var passwordTextField = UITextField().then {
        $0.placeholder = "Password"
        $0.backgroundColor = .gray100
        $0.layer.cornerRadius = 4
        $0.addLeftPadding()
    }
    
    private(set) var startButton = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .primary
        $0.layer.cornerRadius = 8
    }
    
    override func setupSubviews() {
        [signUpLabel, idContainer, passwordContainer, startButton].forEach {
            addSubview($0)
        }
        
        idContainer.addArrangedSubview(idLabel)
        idContainer.addArrangedSubview(idTextField)
        
        passwordContainer.addArrangedSubview(passwordLabel)
        passwordContainer.addArrangedSubview(passwordTextField)
    }
    
    override func setupConstraints() {
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(32)
            make.leading.equalToSuperview().inset(16)
        }
        
        idContainer.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel.snp.bottom).offset(60)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(idContainer.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(32)
        }
        
        ///textField
        idTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        ///label
        idLabel.snp.makeConstraints { make in
            make.height.equalTo(idLabel.intrinsicContentSize)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.height.equalTo(idLabel.intrinsicContentSize)
        }
    }
}

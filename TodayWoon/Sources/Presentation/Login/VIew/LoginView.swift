//
//  LoginView.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/1/24.
//

import UIKit
import SnapKit
import Then

class LoginView: BaseView {
    private(set) var titleLabel = UILabel().then {
        $0.text = "일상의 휴식을\n가져볼까요?"
        $0.font = .systemFont(ofSize: 30, weight: .regular)
        $0.numberOfLines = 0
    }
    
    private let textFieldContainer = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 12
    }
    let idTextField = UITextField().then {
        $0.placeholder = "ID"
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 4
        $0.addLeftPadding()
    }
    let passwordTextField = UITextField().then {
        $0.placeholder = "Password"
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 4
        $0.addLeftPadding()
    }
    private let errorLabel = UILabel().then {
        $0.text = "에러메세지 출력 위치"
        $0.textColor = .red
    }
    
    private let buttonContainer = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 12
    }
    
    private(set) var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
    }
    
    private(set) var signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
    }
    
    override func setupSubviews() {
        [titleLabel, textFieldContainer, buttonContainer].forEach {
            addSubview($0)
        }
        
        [idTextField, passwordTextField, errorLabel].forEach {
            textFieldContainer.addArrangedSubview($0)
        }
        
        textFieldContainer.setCustomSpacing(8, after: passwordTextField)
        
        [loginButton, signUpButton].forEach {
            buttonContainer.addArrangedSubview($0)
        }
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(titleLabel.intrinsicContentSize)
        }
        
        textFieldContainer.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(52)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        buttonContainer.snp.makeConstraints { make in
            make.top.equalTo(textFieldContainer.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        errorLabel.snp.makeConstraints { make in
            print("errorLabel.intrinsicContentSize")
            make.height.equalTo(errorLabel.intrinsicContentSize)
        }
        
        /// textField
        idTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        /// button
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
    
    
    
}

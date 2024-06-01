//
//  UploadAlertView.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class UploadAlertView: BaseView {
    let alertContainer = UIView().then  {
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .white
    }
    let imageView = UIImageView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 12
        $0.backgroundColor = .red
    }
    let descriptionLabel = UILabel().then {
        $0.text = "dldldk"
    }
    let confirmButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .primary
        $0.autoresizingMask = [.flexibleBottomMargin]
    }
    
    override func setupSubviews() {
        layer.masksToBounds = false
        layer.cornerRadius = 12
        
        [alertContainer, imageView, descriptionLabel, confirmButton].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        alertContainer.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(alertContainer.snp.top).offset(16)
            make.leading.equalTo(alertContainer.snp.leading).offset(16)
            make.trailing.equalTo(alertContainer.snp.trailing).offset(-16)
            make.height.equalTo(300)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.leading.equalTo(alertContainer.snp.leading).offset(16)
            make.trailing.equalTo(alertContainer.snp.trailing).offset(-16)
            make.height.equalTo(descriptionLabel.intrinsicContentSize)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
            make.leading.equalTo(alertContainer.snp.leading)
            make.trailing.equalTo(alertContainer.snp.trailing)
            make.bottom.equalTo(alertContainer.snp.bottom)
            make.height.equalTo(56)
        }
    }
}

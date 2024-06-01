//
//  CheckView.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit
import SnapKit
import Then

final class CheckView: BaseView {
    
    private let dogImage = UIImageView().then {
        $0.image = UIImage(systemName: "antenna.radiowaves.left.and.right")
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    private let checkLabel = UILabel().then {
        $0.text = "모인 멍이 확인하기"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let checkImage = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.tintColor = .white
    }
    
    override func setupSubviews() {
        [dogImage, checkLabel, checkImage].forEach {
            self.addSubview($0)
        }
    }

    override func setupConstraints() {
        dogImage.snp.makeConstraints {
            $0.height.width.equalTo(100)
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(26)
        }
        
        checkLabel.snp.makeConstraints {
            $0.leading.equalTo(dogImage.snp.trailing).offset(36)
            $0.centerY.equalToSuperview()
        }
        
        checkImage.snp.makeConstraints {
            $0.leading.equalTo(checkLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
    }
}

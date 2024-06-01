//
//  DeleteView.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/02.
//

import UIKit
import SnapKit
import Then

final class DeleteView: BaseView {
    private let mainLabel = UILabel().then {
        $0.text = "해당 기록을 삭제할까요?"
        $0.textColor = .gray800
        $0.font = TodayWoonFontFamily.Pretendard.medium.font(size: 16)
    }
    
    private let resetButton = UIButton(type: .custom).then {
        $0.setTitle("재촬영", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = TodayWoonFontFamily.Pretendard.semiBold.font(size: 16)
        $0.backgroundColor = .gray700
    }
    
    let checkButton = UIButton(type: .custom).then {
        $0.setTitle("기록", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = TodayWoonFontFamily.Pretendard.semiBold.font(size: 16)
        $0.backgroundColor = .primary
    }
    
    override func setupSubviews() {
        [mainLabel, resetButton, checkButton].forEach {
            self.addSubview($0)
        }
    }

    override func setupConstraints() {
        mainLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(40)
        }
        
        resetButton.snp.makeConstraints {
            $0.width.equalTo(170)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints {
            $0.width.equalTo(170)
            $0.height.equalTo(50)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

//
//  FeedDetailView.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit
import SnapKit
import Then

class FeedDetailView: BaseView {

    private let dateLabel = UILabel().then {
        $0.text = "2024년 6월 1일"
        $0.textColor = .black100
        $0.font = TodayWoonFontFamily.Pretendard.semiBold.font(size: 14)
    }
    
    private let timeLabel = UILabel().then {
        $0.text = "1시 12분 - 2시 10분"
        $0.textColor = .gray500
        $0.font = TodayWoonFontFamily.Pretendard.semiBold.font(size: 14)
    }
    
    private let printImage = UIImageView().then {
        $0.image = UIImage(named: "Foot")
        $0.contentMode = .scaleAspectFit
    }
    
    private let likeLabel = UILabel().then {
        $0.text = "342개"
        $0.textColor = .primary3
        $0.font = TodayWoonFontFamily.Pretendard.medium.font(size: 14)
    }
    
    let deleteButton = UIButton(type: .custom).then {
        $0.setTitle("기록 삭제", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = TodayWoonFontFamily.Pretendard.medium.font(size: 14)
        $0.tintColor = .gray600
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
    }

    private let feedImage = UIImageView().then {
        $0.image = UIImage(named: "img_sky")
        $0.tintColor = .white
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
    }
    
    override func setupSubviews() {
        [dateLabel, timeLabel, printImage, likeLabel, deleteButton, feedImage].forEach {
            self.addSubview($0)
        }
    }

    override func setupConstraints() {
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.height.equalTo(dateLabel.intrinsicContentSize)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
            $0.height.equalTo(timeLabel.intrinsicContentSize)
        }
        
        printImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(timeLabel.snp.bottom).offset(10)
            $0.width.height.equalTo(20)
            $0.height.equalTo(printImage.intrinsicContentSize)
        }
        
        likeLabel.snp.makeConstraints {
            $0.leading.equalTo(printImage.snp.trailing).offset(8)
            $0.top.equalTo(timeLabel.snp.bottom).offset(10)
            $0.height.equalTo(likeLabel.intrinsicContentSize)
        }
        
        deleteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        feedImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(printImage.snp.bottom).offset(20)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

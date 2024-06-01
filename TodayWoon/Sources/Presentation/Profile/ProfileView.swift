//
//  ProfileView.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit
import SnapKit
import Then

final class ProfileView: BaseView {
    private let totalLabel = UILabel().then {
        $0.text = "6월 동안\n24시간 4분 산책했어요"
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 30)
    }
    
    private let checkView = CheckView().then {
        $0.backgroundColor = .purple
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
    }
    
    private let myLabel = UILabel().then {
        $0.text = "나의 기록"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 17)
    }
    
    private let numLabel = UILabel().then {
        $0.text = "총 n번"
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    lazy var gridView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let itemWidth = UIScreen.main.bounds.width / 2 - 20
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumInteritemSpacing = 10
        
        let grid = UICollectionView(frame: .zero, collectionViewLayout: layout)
        grid.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.cellId)
        grid.showsVerticalScrollIndicator = false
        return grid
    }()
    
    override func setupSubviews() {
        
        [totalLabel, checkView, myLabel, numLabel, gridView].forEach {
            self.addSubview($0)
        }
    }

    override func setupConstraints() {
        totalLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(100)
        }
        
        checkView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(totalLabel.snp.bottom).offset(20)
            $0.height.equalTo(120)
        }
        
        myLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(checkView.snp.bottom).offset(50)
        }
        
        numLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(checkView.snp.bottom).offset(50)
        }
        
        gridView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().offset(-14)
            $0.top.equalTo(myLabel.snp.bottom).offset(30)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

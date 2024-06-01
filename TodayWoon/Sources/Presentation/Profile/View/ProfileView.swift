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
    
    private let titleLabel = UILabel().then {
        $0.text = "마이페이지"
        $0.textColor = .black100
        $0.font = TodayWoonFontFamily.Pretendard.semiBold.font(size: 20)
    }
    
//    private let totalLabel = UILabel().then {
//        $0.text = "6월 동안\n24시간 4분 산책했어요"
//        $0.textColor = .black
//        $0.numberOfLines = 2
//        $0.font = UIFont.systemFont(ofSize: 30)
//    }
    
    private let myPageImage = UIImageView().then {
        $0.image = UIImage(named: "MyPage")
    }
    
    
    
//    private let checkView = CheckView().then {
//        $0.backgroundColor = .purple
//        $0.layer.masksToBounds = true
//        $0.layer.cornerRadius = 15
//    }
    
    private let chartImage = UIImageView().then {
        $0.image = TodayWoonAsset.Assets.imgGraph.image
    }
    
    private let myLabel = UILabel().then {
        $0.text = "나의 기록"
        $0.textColor = .black100
        $0.font = TodayWoonFontFamily.Pretendard.semiBold.font(size: 18)
    }
    
    private let numLabel = UILabel().then {
        $0.text = "총 n번"
        $0.textColor = .gray500
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
        
        [titleLabel, myPageImage, myLabel, numLabel, gridView].forEach {
            self.addSubview($0)
        }
    }

    override func setupConstraints() {
        
//        totalLabel.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(16)
//            $0.top.equalToSuperview().offset(100)
//        }
//        
//        dogImage.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(16)
//            $0.top.equalToSuperview().offset(16)
//            $0.width.height.equalTo(100)
//        }
//        
//        checkView.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(16)
//            $0.trailing.equalToSuperview().offset(-16)
//            $0.top.equalTo(totalLabel.snp.bottom).offset(20)
//            $0.height.equalTo(120)
//        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(100)
        }
        
        myPageImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.width.equalTo(328)
            $0.height.equalTo(320)
        }
        
        myLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(myPageImage.snp.bottom).offset(20)
        }
        
        numLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(myPageImage.snp.bottom).offset(20)
        }
        
        gridView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().offset(-14)
            $0.top.equalTo(myLabel.snp.bottom).offset(30)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

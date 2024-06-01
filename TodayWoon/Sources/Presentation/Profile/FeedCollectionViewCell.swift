//
//  FeedCollectionViewCell.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit
import SnapKit
import Then

final class FeedCollectionViewCell: UICollectionViewCell {
    static let cellId = "FeedCollectionViewCell"

    private let feedImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(systemName: "cloud.bolt")
        $0.tintColor = .white
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
    }
    
    override init(frame : CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        setUp()
        setLayout()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
    }
    
    func setUp() {
        self.addSubview(feedImage)
    }
    
    func setLayout() {
        feedImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

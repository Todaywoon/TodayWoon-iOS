//
//  FeedTableViewCell.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit
// kingfisher

class FeedTableViewCell: UITableViewCell, ReusableCell {
    
    var feedImageView: UIImageView = {
        let image = TodayWoonAsset.Assets.imgSky.image
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }()
    
    private let gradientView: GradientView = {
        let view = GradientView()
        view.gradientLayerColors = [.feedGradientColor1, .feedGradientColor2]
        return view
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let stampImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foot_gray")
        return imageView
    }()
    
    func setup(_ label: String) {
        self.contentView.addSubview(feedImageView)
        feedImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        
        self.contentView.addSubview(idLabel)
        idLabel.text = label
        idLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(14)
        }
        
        self.contentView.addSubview(stampImageView)
        stampImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.width.height.equalTo(20)
            make.centerY.equalTo(idLabel.snp.centerY)
        }
    }
}

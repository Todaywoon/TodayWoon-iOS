//
//  FeedTableViewCell.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit
// kingfisher

class FeedTableViewCell: UITableViewCell, ReusableCell {
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray300
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    let feedImageView: UIImageView = {
        let image = TodayWoonAsset.Assets.imgSky.image
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }()
    
    private let gradientView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.gradientLayerColors = [.feedGradientColor1, .feedGradientColor2]
        return view
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let stampImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "foot_gray")
        return imageView
    }()
    
    func setup(_ label: String, _ date: String, _ time: String) {
        self.contentView.addSubview(feedImageView)
        feedImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(feedImageView.snp.top).offset(20)
            make.height.equalTo(14)
            make.width.equalTo(93)
        }
        dateLabel.text = date
        
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.height.equalTo(14)
            make.width.equalTo(113)
        }
        timeLabel.text = time
        
        self.contentView.addSubview(gradientView)
        gradientView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        
        self.contentView.addSubview(idLabel)
        idLabel.text = label
        idLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(20)
        }
        
        self.contentView.addSubview(stampImageView)
        stampImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(24)
            make.centerY.equalTo(idLabel.snp.centerY)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 16, bottom: 16, right: 16))
    }
}

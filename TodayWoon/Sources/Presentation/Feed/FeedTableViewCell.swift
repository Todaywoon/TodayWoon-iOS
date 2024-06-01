//
//  FeedTableViewCell.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit
// kingfisher

class FeedTableViewCell: UITableViewCell, ReusableCell {
    
    private let feedImageView: UIImageView = {
        let image = UIImage(systemName: "star.fill")
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
        label.text = "@yuzxcxz"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let stampImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        return imageView
    }()
    
    func setup() {
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

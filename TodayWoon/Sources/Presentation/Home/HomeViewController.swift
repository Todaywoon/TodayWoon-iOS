//
//  HomeViewController.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let walkStartButton: WalkStartButton = {
        let button = WalkStartButton(type: .start)
        return button
    }()
    
    private let walkEndButton: WalkEndButton = {
        let button = WalkEndButton(type: .inactive)
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.view.addSubview(walkStartButton)
        walkStartButton.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(210)
        }
        walkStartButton.addTarget(self, action: #selector(walkStartButtonClicked), for: .touchUpInside)
        
        self.view.addSubview(walkEndButton)
        walkEndButton.snp.makeConstraints { make in
            make.width.equalTo(280)
            make.height.equalTo(56)
            make.centerX.equalToSuperview()
            make.top.equalTo(walkStartButton.snp.bottom).offset(8)
        }
        walkEndButton.addTarget(self, action: #selector(walkEndButtonClicked), for: .touchUpInside)
    }
    
    @objc private func walkStartButtonClicked() {
        if walkStartButton.type == .start {
            walkStartButton.type = .camera
            walkStartButton.updateUI()
            walkEndButton.isHidden = false
        } else {
            /// CameraVC 로 이동
        }
    }
    
    @objc private func walkEndButtonClicked() {
        if walkEndButton.type == .inactive {
            
        } else {
            
        }
    }
}

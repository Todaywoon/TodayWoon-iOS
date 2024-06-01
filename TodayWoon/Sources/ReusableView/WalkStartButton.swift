//
//  WalkButton.swift
//  TodayWoon
//
//  Created by 백유정 on 6/2/24.
//

import UIKit

enum WalkStartButtonState {
    case start
    case camera
}

final class WalkStartButton: UIButton {
    
    var type: WalkStartButtonState
    
    init(type: WalkStartButtonState) {
        self.type = type
        super.init(frame: .zero)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        if type == .start {
            let image = UIImage(named: "walkStartButton_start")
            self.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "walkStartButton_camera")
            self.setImage(image, for: .normal)
        }
    }
}

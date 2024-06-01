//
//  WalkEndButton.swift
//  TodayWoon
//
//  Created by 백유정 on 6/2/24.
//

import UIKit

enum WalkEndButtonState {
    case inactive
    case active
}

final class WalkEndButton: UIButton {
    
    var type: WalkEndButtonState
    
    init(type: WalkEndButtonState) {
        self.type = type
        super.init(frame: .zero)
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        if type == .inactive {
            let image = UIImage(named: "walkEndButton_inactive")
            self.setImage(image, for: .normal)
        } else {
            let image = UIImage(named: "walkEndButton_active")
            self.setImage(image, for: .normal)
        }
    }
}

//
//  UploadAlert.swift
//  TodayWoon
//
//  Created by 이숭인 on 6/2/24.
//

import Foundation
import UIKit
import Combine
import CombineCocoa

final class UploadAlert: ViewController<UploadAlertView> {
    var cancellables = Set<AnyCancellable>()
    var selectedImage: UIImage?
    
    init(selectedImage: UIImage) {
        self.selectedImage = selectedImage
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        view.isOpaque = false
        
        bindAction()
    }
    
    private func bindAction() {
        contentView.confirmButton.tap
            .sink { [weak self] _ in
                self?.dismiss(animated: false)
            }
            .store(in: &cancellables)
    }
}

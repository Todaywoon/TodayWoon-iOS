//
//  DeleteViewController.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/02.
//

import UIKit
import SnapKit
import Then
import Combine

final class DeleteViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    
    var deleteView = DeleteView()
    
    private let modalView = DeleteView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setUp()
        setLayout()
        bindAction()
    }
    
    func bindAction() {
        deleteView.checkButton.tap
            .sink { _ in
                
                let FeedDetailVC = FeedDetailViewController()
                self.navigationController?.pushViewController(FeedDetailVC, animated: false)
            }
            .store(in: &cancellables)
    }
    
    func setUp() {
        view.addSubview(modalView)
    }
    
    func setLayout() {
        modalView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(340)
            $0.height.equalTo(160)
        }
    }

}

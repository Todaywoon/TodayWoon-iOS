//
//  FeedDetailViewController.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit
import SnapKit
import Then
import Combine

class FeedDetailViewController: ViewController<FeedDetailView> {
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        // TransparentViewController 인스턴스 생성
//        let transparentVC = DeleteViewController()
//        
//        // 자식 뷰 컨트롤러로 추가
//        addChild(transparentVC)
//        view.addSubview(transparentVC.view)
//        
//        // 자식 뷰 컨트롤러의 뷰 프레임 설정 (필요에 따라 조정)
//        transparentVC.view.frame = view.bounds
//        transparentVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        // 자식 뷰 컨트롤러의 didMove(toParent:) 호출
//        transparentVC.didMove(toParent: self)
        
        bindAction()

    }
    
    func bindAction() {
        contentView.deleteButton.tap
            .sink { _ in
                
                let deleteVC = DeleteViewController()
//                deleteVC.modalPresentationStyle = .fullScreen
                deleteVC.modalPresentationStyle = .overCurrentContext
                deleteVC.modalTransitionStyle = .crossDissolve
    
                self.present(deleteVC, animated: false)
            }
            .store(in: &cancellables)
    }
}

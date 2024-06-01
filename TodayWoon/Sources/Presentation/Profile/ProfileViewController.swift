//
//  ProfileViewController.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit

final class ProfileViewController: ViewController<ProfileView> {
    var viewModel: ProfileViewModel
    
    init(_ viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.gridView.dataSource = self
        contentView.gridView.delegate = self
        
        contentView.backgroundColor = .white
    }
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        self.items.count
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellId, for: indexPath) as! FeedCollectionViewCell
        //        cell.prepare(color: self.items[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectVC = FeedDetailViewController()
        //        settingVC.delegate = self
        
        //        let array = memberListManager.getMemberList()
        //        detailVC.member = array[indexPath.row]
        navigationController?.pushViewController(selectVC, animated: true)
    }
}

final class ProfileViewModel {
    weak var coordinator: TabCoordinator?
    
    func didTapBottomButton() {
        coordinator?.finish()
    }
}

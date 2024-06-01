//
//  ProfileViewController.swift
//  TodayWoon
//
//  Created by 이승진 on 2024/06/01.
//

import UIKit
import Combine
import CombineExt

final class ProfileViewController: ViewController<ProfileView> {
    var viewModel: ProfileViewModel
    var cancellables = Set<AnyCancellable>()
    
    var feeds: [UIImage] = [
        TodayWoonAsset.Assets.feed1.image,
        TodayWoonAsset.Assets.feed2.image,
        TodayWoonAsset.Assets.feed3.image,
        TodayWoonAsset.Assets.feed4.image,
        TodayWoonAsset.Assets.feed5.image,
        TodayWoonAsset.Assets.feed6.image
        ]
    
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
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.feedsSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.contentView.gridView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        self.items.count
        return viewModel.feeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.cellId, for: indexPath) as! FeedCollectionViewCell
        //        cell.prepare(color: self.items[indexPath.item])
        
        cell.feedImage.image = feeds[indexPath.row]
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
    let reposiotry = ProfileRepository()
    var cancellables = Set<AnyCancellable>()
    
    var feedsSubject = CurrentValueSubject<[Feed], Never>([])
    var feeds: [Feed] {
        feedsSubject.value
    }
    
    init() {
        requestMyFeeds()
    }
    
    func didTapBottomButton() {
        coordinator?.finish()
    }
    
    func requestMyFeeds() {
        let publisher = reposiotry.requestMyFeeds().share().materialize()
        
        publisher.values()
            .sink { [weak self] myInfo in
                self?.feedsSubject.send(myInfo.feeds)
            }
            .store(in: &cancellables)
        
        publisher.failures()
            .sink { [weak self] error in
                print("error > ")
            }
            .store(in: &cancellables)
    }
}

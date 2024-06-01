//
//  FeedViewController.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    private var currentItemIndex = 0
    private let dateArray = ["2024년 6월 1일", "2024년 6월 1일", "2024년 6월 1일", "2024년 6월 2일", "2024년 6월 2일",
                             "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일",
                             "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일",
                             "2024년 6월 2일", "2024년 6월 2일", "2024년 6월 2일"]
    private let timeArray = ["1시 12분 - 2시 10분", "2시 43분 - 2시 56분", "6시 46분 - 7시 12분", "4시 22분 - 5시 10분", "3시 44분 - 4시 32분",
                             "1시 12분 - 2시 10분", "2시 43분 - 2시 56분", "6시 46분 - 7시 12분", "4시 22분 - 5시 10분", "3시 44분 - 4시 32분",
                             "1시 12분 - 2시 10분", "2시 43분 - 2시 56분", "6시 46분 - 7시 12분", "4시 22분 - 5시 10분", "3시 44분 - 4시 32분",
                             "1시 12분 - 2시 10분", "2시 43분 - 2시 56분", "6시 46분 - 7시 12분", "4시 22분 - 5시 10분", "3시 44분 - 4시 32분",]
    private let idArray = [
        "@seunge",
        "@yuzxcxz",
        "@sjinEEE",
        "@mumu",
        "@litoo",
        "@seunge",
        "@yuzxcxz",
        "@sjinEEE",
        "@mumu",
        "@litoo",
        "@seunge",
        "@yuzxcxz",
        "@sjinEEE",
        "@mumu",
        "@litoo",
        "@seunge",
        "@yuzxcxz",
        "@sjinEEE"
    ]
    
    var feeds: [UIImage] = [
        TodayWoonAsset.Assets.feed1.image,
        TodayWoonAsset.Assets.feed2.image,
        TodayWoonAsset.Assets.feed3.image,
        TodayWoonAsset.Assets.feed4.image,
        TodayWoonAsset.Assets.feed5.image,
        TodayWoonAsset.Assets.feed6.image,
        TodayWoonAsset.Assets.feed7.image,
        TodayWoonAsset.Assets.feed8.image,
        TodayWoonAsset.Assets.feed9.image,
        TodayWoonAsset.Assets.feed10.image,
        TodayWoonAsset.Assets.feed11.image,
        TodayWoonAsset.Assets.feed12.image,
        TodayWoonAsset.Assets.feed13.image,
        TodayWoonAsset.Assets.feed14.image,
        TodayWoonAsset.Assets.feed15.image,
        TodayWoonAsset.Assets.feed16.image,
        TodayWoonAsset.Assets.feed17.image,
        TodayWoonAsset.Assets.feed18.image,
    ]
    
    private let feedTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    lazy var alarmButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "alarm.fill"), style: .plain, target: self, action: #selector(alarmButtonClicked))
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setAttribute()
        setupConstraints()
        setNavigationBarButton()
        self.navigationController?.navigationBar.alpha = 0
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension FeedViewController {
    
    @objc private func alarmButtonClicked() {
        
    }
    
    private func setAttribute() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.decelerationRate = .fast
        feedTableView.clipsToBounds = false
        feedTableView.register(cellType: FeedTableViewCell.self)
    }
    
    private func setupConstraints() {
        self.view.addSubview(feedTableView)
        feedTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
//            make.top.equalTo(view)
//            make.horizontalEdges.equalToSuperview()
//            make.bottom.equalToSuperview()
        }
    }
    
    private func setNavigationBarButton() {
        self.navigationItem.rightBarButtonItem = alarmButton
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = .zero
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let cellCount = feed.count
        return feeds.count //cellCount + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        if indexPath.row < feed.count {
            let cellId = "FEED_CELL_\(feed[indexPath.row])_" + String(LoginManager.shared.islogin)
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? GraffitiTableViewCell
            
            if cell == nil {
                cell = GraffitiTableViewCell(style: .default, reuseIdentifier: cellId, feed: feed[indexPath.row])
                cell?.delegate = self
            }
            
            return cell ?? UITableViewCell()
        } else {
            if isMoreFeed == true {
                let cellId = "LOADING_CELL"
                var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
                
                if cell == nil {
                    cell = UITableViewCell()
                    cell = GraffitiSkeletonTableViewCell(style: .default, reuseIdentifier: cellId)
                }
                
                getFeed(feedLastIdx)
                
                return cell ?? UITableViewCell()
                
                
            } else {
                if isThereFeed == true {
                    let cell = graffitiTableView.dequeueReusableCell(cellType: GraffitiLastTableViewCell.self, indexPath: indexPath)
                    cell.setting()
                    return cell
                }
                let cell = graffitiTableView.dequeueReusableCell(cellType: GraffitiEmptyTableViewCell.self, indexPath: indexPath)
                cell.setting()
                return cell
            }
        }
         */
        
        let cell = feedTableView.dequeueReusableCell(cellType: FeedTableViewCell.self, indexPath: indexPath)
        cell.setup(idArray[indexPath.row], dateArray[indexPath.row], timeArray[indexPath.row])
        cell.feedImageView.image = feeds[indexPath.row]
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView.contentOffset.y < -300 {
            feedTableView.reloadData()
        }
            
        if velocity.y > 0.85 {
            if 18 > currentItemIndex + 1 {
                scrollUpDown(setRow: 1)
            } else {
                scrollUpDown()
            }
        } else if velocity.y < -0.85 {
            if 0 < currentItemIndex {
                scrollUpDown(setRow: -1)
            } else {
                scrollUpDown()
            }
        } else {
            scrollUpDown()
        }
    }
    
    private func scrollUpDown(setRow: Int = 0) {
        DispatchQueue.main.async { [self] in
            currentItemIndex = currentItemIndex + setRow
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) { [self] in
                feedTableView.scrollToRow(at: IndexPath(row: currentItemIndex, section: 0), at: .top, animated: false)
            }
        }
    }
}

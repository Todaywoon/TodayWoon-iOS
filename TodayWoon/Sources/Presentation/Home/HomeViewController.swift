//
//  HomeViewController.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit
import AVFoundation
import SnapKit
import Then
import Lottie

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
    
    private let imageView = UIImageView()
    private var photoImage = UIImage()
    
    let timeContainer = UIView().then {
        $0.layer.masksToBounds = false
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 2, height: 4)
        /// shadow의 투명도 (0 ~ 1)
        $0.layer.shadowOpacity = 0.5
        /// shadow의 corner radius
        $0.layer.shadowRadius = 5.0
        $0.layer.cornerRadius = 28
    }
    private let startDescriptionLabel = UILabel().then {
        $0.font = TodayWoonFontFamily.Pretendard.regular.font(size: 18)
        $0.textColor = .primary
        $0.textAlignment = .center
        $0.text = "Start Time"
    }
    private let timeLabel = UILabel().then {
        $0.textColor = .gray700
        $0.font = TodayWoonFontFamily.Pretendard.regular.font(size: 28)
        $0.text = "10:24"
    }
    
    
    let animationView = LottieAnimationView().then {
        $0.animation = LottieAnimation.named("inside")
        $0.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        $0.contentMode = .scaleAspectFill
        $0.backgroundBehavior = .pauseAndRestore
        $0.loopMode = .loop
        $0.play(fromProgress: 0, toProgress: 2.0, loopMode: .loop, completion: { _ in
        })
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(animationView)
        
        setupConstraints()
        animationView.play()
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
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
        
        [timeContainer, startDescriptionLabel, timeLabel].forEach {
            view.addSubview($0)
        }
        
        timeContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.centerX.equalToSuperview()
            make.height.equalTo(52)
        }
        
        startDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(timeContainer.snp.top).offset(8)
            make.leading.equalTo(timeContainer.snp.leading).offset(32)
            make.trailing.equalTo(timeContainer.snp.trailing).offset(-32)
            make.height.equalTo(startDescriptionLabel.intrinsicContentSize)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(timeContainer.snp.centerX)
            make.top.equalTo(startDescriptionLabel.snp.bottom).offset(4)
            make.height.equalTo(timeLabel.intrinsicContentSize)
            make.bottom.equalTo(timeContainer.snp.bottom).offset(-8)
        }
        
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func walkStartButtonClicked() {
        //TODO: upload alert
//        let alert = UploadAlert(selectedImage: photoImage)
//        alert.modalPresentationStyle = .overCurrentContext
//        alert.modalTransitionStyle = .crossDissolve
//        present(alert, animated: false)
        
        if walkStartButton.type == .start {
            // lottie 전환
            animationView.animation = LottieAnimation.named("outside")
            animationView.play()
            
            walkStartButton.type = .camera
            walkStartButton.updateUI()
            walkEndButton.isHidden = false
        } else {
            /// CameraVC 로 이동
            openCamera()
        }
    }
    
    private func openCamera() {
      #if targetEnvironment(simulator)
      fatalError()
      #endif
      // Privacy - Camera Usage Description
      AVCaptureDevice.requestAccess(for: .video) { [weak self] isAuthorized in
        guard isAuthorized else {
          self?.showAlertGoToSetting()
          return
        }
        
        DispatchQueue.main.async {
          let pickerController = UIImagePickerController() // must be used from main thread only
          pickerController.sourceType = .camera
          pickerController.allowsEditing = false
          pickerController.mediaTypes = ["public.image"]
          // 만약 비디오가 필요한 경우,
    //      imagePicker.mediaTypes = ["public.movie"]
    //      imagePicker.videoQuality = .typeHigh
          pickerController.delegate = self
          self?.present(pickerController, animated: true)
        }
      }
    }
    
    func showAlertGoToSetting() {
      let alertController = UIAlertController(
        title: "현재 카메라 사용에 대한 접근 권한이 없습니다.",
        message: "설정 > hangahanga 탭 에서 접근을 활성화 할 수 있습니다.",
        preferredStyle: .alert
      )
      let cancelAlert = UIAlertAction(
        title: "취소",
        style: .cancel
      ) { _ in
          alertController.dismiss(animated: true, completion: nil)
        }
      let goToSettingAlert = UIAlertAction(
        title: "설정으로 이동하기",
        style: .default) { _ in
          guard
            let settingURL = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(settingURL)
          else { return }
          UIApplication.shared.open(settingURL, options: [:])
        }
      [cancelAlert, goToSettingAlert]
        .forEach(alertController.addAction(_:))
      DispatchQueue.main.async {
        self.present(alertController, animated: true) // must be used from main thread only
      }
    }
    
    @objc private func walkEndButtonClicked() {
        if walkEndButton.type == .inactive {
            
        } else {
            
        }
    }
}

extension HomeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true)
            return
        }
        
        self.imageView.image = image
        
        // 업로드 로직 넣어야함
        
        picker.dismiss(animated: true, completion: nil)
    }
  }

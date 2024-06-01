//
//  HomeViewController.swift
//  TodayWoon
//
//  Created by 백유정 on 6/1/24.
//

import UIKit
import AVFoundation
import Alamofire

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
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
    @objc private func walkStartButtonClicked() {
        if walkStartButton.type == .start {
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

extension HomeViewController {
    
    func uploadImage() {
        /**
         Content-Type: form-data

         {
          image : {MultiPartFile(jpg, png, jpeg},
         body : {
           start_time:{String, yyyy-mm-dd   hh:mm:ss}
           finish_time:{String, yyyy-mm-dd hh:mm:ss}
           }
         }
         **/
        
        let url = "http://10.10.150.157:8080/feed" //EndPoint.savePost.path
        var params = ["image" : self.photoImage,
                      "start_time" : "2024-06-02 11:11:11",
                      "finish_time" : "2024-06-03 22:22:22"] as [String : Any]
        
        self.walkStartButton.hide()
        
        APIService().postImage(userID: "3333", password: "3333", url: url, parameters: params)
    }
}

extension HomeViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true)
            return
        }
        
        self.photoImage = image
        self.imageView.image = image
        
        uploadImage()
        
        picker.dismiss(animated: true, completion: nil)
    }
  }

class Empty: Encodable {
    
}

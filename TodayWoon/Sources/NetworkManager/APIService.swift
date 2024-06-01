//
//  APIService.swift
//  TodayWoon
//
//  Created by 백유정 on 6/2/24.
//

import UIKit
import Alamofire
import SnapKit

struct APIService {
    
    static let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.alpha = 0.8
        return view
    }()
    
    static let loadingIndicator = UIActivityIndicatorView()
    
    func attachLoadingView() {
        setLayoutToWindow()
        APIService.loadingIndicator.startAnimating()
    }
    
    func detachLoadingView() {
        APIService.loadingView.removeFromSuperview()
        APIService.loadingIndicator.removeFromSuperview()
    }
    
    private func setLayoutToWindow() {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        
        window.addSubview(APIService.loadingView)
        window.addSubview(APIService.loadingIndicator)
        
        APIService.loadingView.snp.makeConstraints { make in
            make.center.equalTo(window)
            make.width.equalTo(45)
            make.height.equalTo(45)
        }
        
        APIService.loadingIndicator.snp.makeConstraints { make in
            make.center.equalTo(window)
        }
    }
    
    func postImages<T: Codable>(of type: T.Type, _ url: URLConvertible, _ parameters: [String : Any], success: @escaping (T) -> (), failure: ((Error) -> ())? = nil) {
        
        let header = ["Content-Type" : "multipart/form-data"] as HTTPHeaders
        
        attachLoadingView()
        
        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                if let image = value as? UIImage {
                    if let imageData = image.jpegData(compressionQuality: 0.8) {
                        multipartFormData.append(imageData, withName: key, fileName: key+".jpg", mimeType: "image/jpeg")
                    }
                } else if let string = value as? String {
                    if let stringData = string.data(using: .utf8) {
                        multipartFormData.append(stringData, withName: key)
                    }
                }
            }
        }, to: url, method: .post, headers: header).responseDecodable(of: type) { response in
            detachLoadingView()
            
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                if let failure = failure {
                    failure(error)
                } else {
                    AlertController(message: error.localizedDescription).show()
                }
            }
        }
    }
    
    func postImage(userID: String, password: String, url: URLConvertible, parameters: [String : Any]) {
        
        let header = ["Content-Type" : "multipart/form-data",
                      "user_id": userID,
                      "password": password] as HTTPHeaders

        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                if let image = value as? UIImage {
                    if let imageData = image.jpegData(compressionQuality: 0.8) {
                        multipartFormData.append(imageData, withName: key, fileName: key+".jpg", mimeType: "image/jpeg")
                    }
                } else if let string = value as? String {
                    if let stringData = string.data(using: .utf8) {
                        multipartFormData.append(stringData, withName: key)
                    }
                }
            }
        }, to: url, method: .post, headers: header).response { response in
            if response.error != nil {
                /** 파일 업로드 실패*/
                print("fail")
            } else {
                
                print(response.result, "result")
                print("log")
            }
        }
    }
}

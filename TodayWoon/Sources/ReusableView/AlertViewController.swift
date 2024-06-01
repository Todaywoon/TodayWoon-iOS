//
//  AlertViewController.swift
//  TodayWoon
//
//  Created by 백유정 on 6/2/24.
//

import UIKit

final class AlertController {
    
    var alertController: UIAlertController
    
    init(message: String, completion: @escaping () -> () = {}) {
        alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { alert in
            completion()
        }
        alertController.addAction(okAction)
    }
    
    func show() {
        let presentVC = UIViewController().findPresentViewController()
        presentVC.present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func findPresentViewController() -> UIViewController {
        let windowScene = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let keyWindow = windowScene.windows.first
        assert((keyWindow != nil), "keyWindow is empty")
        
        var presentViewController = keyWindow?.rootViewController

        while true {
           while let presentedViewController = presentViewController?.presentedViewController {
               presentViewController = presentedViewController
           }
           if let navigationController = presentViewController as? UINavigationController {
               presentViewController = navigationController.visibleViewController
               continue
           }
           if let tabBarController = presentViewController as? UITabBarController {
               presentViewController = tabBarController.selectedViewController
               continue
           }
           break
        }
        
        guard let presentViewController = presentViewController else {
            return UIViewController()
        }
        
        return presentViewController
    }
}

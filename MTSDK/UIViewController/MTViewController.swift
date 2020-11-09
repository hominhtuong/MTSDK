//
//  MTViewController.swift
//  MTSDK
//
//  Created by Songoku on 11/9/20.
//

import Foundation
import UIKit

public var topViewController: UIViewController? {
    let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    if var topController = keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
    return nil
}


public extension UIViewController {
    func showAlert(title: String? = nil, message: String? = nil, actionTile: String = "OK", completion: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTile, style: .cancel, handler: { _ in
            if completion != nil {
                completion!()
            }
        })
        alertVC.addAction(action)
        if let popoverController = alertVC.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        self.present(alertVC, animated: true, completion: {
            
        })
    }
    
    func openURL(_ urlAddress: String) {
        guard let url = URL(string: urlAddress) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func share(items: [Any], completion: ((Bool) -> Void)? = nil) {
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: [])
        if let popoverController = activityVC.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        activityVC.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                if completion != nil {
                    completion!(false)
                }
                return
            }
            if completion != nil {
                completion!(true)
            }
        }
        
        present(activityVC, animated: true)
    }
    
}

public extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

public extension UIViewController {
    func add(_ child: UIViewController, with frame: CGRect = .zero) {
        child.view.frame = frame
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

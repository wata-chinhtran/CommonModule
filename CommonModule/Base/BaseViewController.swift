//
//  BaseViewController.swift
//  CommonModule
//
//  Created by Tran Tuan Vu on 26/10/2021.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import SnapKit

class BaseViewController: UIViewController{
    
    var indicator : NVActivityIndicatorView?
    
    
    func showErrorAlert(title: String, message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okiAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertViewController.addAction(okiAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func showErrorAlert(title: String, message: String, completion:@escaping() -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okiAction = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            completion()
        })
        alertViewController.addAction(okiAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertViewController(title: String, message: String, completion: @escaping (_ result: Bool) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            completion(true)
        }))
    }
    
    func isValidEmail(emailID:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
        
    }
    
    
}

// MARK: - Handle Indicator
extension BaseViewController {
    func addLoadingIndicator() {
        let frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.indicator = NVActivityIndicatorView(frame: frame,
                                                 type: .ballSpinFadeLoader)
        self.view.addSubview(self.indicator!)
        self.indicator?.color = UIColor.gray
        
        self.indicator?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.view).offset((self.tabBarController?.tabBar.height ?? 0) / 2)
        })
    }
    
    func startLoadingIndicator() {
        if self.indicator != nil {
            if let indicatorSView = self.indicator?.superview {
                self.indicator?.bringSubviewToFront(indicatorSView)
            }
            
            self.indicator?.startAnimating()
            view.isUserInteractionEnabled = false
        }
    }
    
    func stopLoadingIndicator() {
        if self.indicator != nil {
            self.indicator?.stopAnimating()
            view.isUserInteractionEnabled = true
        }
    }
}

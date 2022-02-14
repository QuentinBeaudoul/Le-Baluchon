//
//  UIAlertController.swift
//  Extension
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import UIKit

public extension UIAlertController {
    class func showAlert(title: String, message: String, on viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true)
    }
}

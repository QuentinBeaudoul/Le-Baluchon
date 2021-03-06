//
//  UIView.swift
//  Extension
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import Foundation
import UIKit

@IBDesignable public extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return UIColor() }
            return UIColor(cgColor: borderColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func applyActivityIndicator() {
        let noRatesActivityIndicator = UIActivityIndicatorView()
        noRatesActivityIndicator.color = R.color.primary()
        self.addSubview(noRatesActivityIndicator)
        noRatesActivityIndicator.frame = self.bounds
        noRatesActivityIndicator.startAnimating()
    }
}


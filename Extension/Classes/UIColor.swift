//
//  UIColor.swift
//  Extension
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import UIKit

extension UIColor {
    class func color(named: String, in bundle: Bundle) -> UIColor {
        return UIColor(named: named, in: bundle, compatibleWith: nil) ?? .clear
    }
}

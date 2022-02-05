//
//  UIImage.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import Foundation
import UIKit

extension UIImage {
    class func image(named: String) -> UIImage {
        return UIImage(named: named, in: Bundle(for: self), with: nil) ?? UIImage()
    }
}

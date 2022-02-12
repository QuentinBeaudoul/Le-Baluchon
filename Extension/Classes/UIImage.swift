//
//  UIImage.swift
//  Extension
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit

public extension UIImage {

    class func image(named: String, in bundle: Bundle) -> UIImage {
        return UIImage(named: named, in: bundle, with: nil) ?? UIImage()
    }
}

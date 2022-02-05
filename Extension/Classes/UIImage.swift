//
//  UIImage.swift
//  Extension
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit

public extension UIImage {
    class func image(named: String, classe: AnyClass) -> UIImage {
        return UIImage(named: named, in: Bundle(for: classe.self), with: nil) ?? UIImage()
    }
}

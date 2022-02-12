//
//  UIImage.swift
//  Extension
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import UIKit

public extension UIImageView {
    func setImageColor(_ color: UIColor?) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}

//
//  UIImage.swift
//  Extension
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import UIKit

public extension UIImageView {
    func setImage(_ image: UIImage?, with color: UIColor?) {
        self.image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}

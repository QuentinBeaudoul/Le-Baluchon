//
//  UICollectionViewCell.swift
//  Extension
//
//  Created by Quentin Beaudoul on 19/02/2022.
//

import Foundation
import UIKit

public extension UITableViewCell {
    class func getCellIdentifier() -> String {
        return String(describing: self)
    }
}

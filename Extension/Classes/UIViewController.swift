//
//  UIViewController.swift
//  Extension
//
//  Created by Quentin on 14/02/2022.
//

import UIKit

public extension UIViewController {
    
    class func makeFromStoryboard(_ storyboardName: String? = nil, withTitle title: String? = nil, in bundle: Bundle? = nil) -> UIViewController {
        let vc = UIStoryboard(name: storyboardName ?? String(describing: self).replacingOccurrences(of: "ViewController", with: ""), bundle: bundle).instantiateViewController(withIdentifier: String(describing: self))
        vc.title = title
        return vc
    }
}

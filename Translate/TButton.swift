//
//  TButton.swift
//  Translate
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import UIKit
import LoadableViews
import Extension

protocol TButtonDelegate: AnyObject {
    func onButtonTapped(type: TButtonType?)
}

enum TButtonType {
    case source
    case target
}

class TButton: LoadableView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var view: UIView!
    
    weak var delegate: TButtonDelegate?
    var type: TButtonType?

    func fillView(title: String?, type: TButtonType) {
        self.type = type
        label.text = title

        switch type {
        case .source:
            label.textColor = Extension.R.color.onPrimaryContainer()
            imageView.tintColor = Extension.R.color.onPrimaryContainer()
            view.backgroundColor = Extension.R.color.primaryContainer(compatibleWith: traitCollection)
        case .target:
            label.textColor = Extension.R.color.onSecondaryContainer()
            imageView.tintColor = Extension.R.color.onSecondaryContainer()
            view.backgroundColor = Extension.R.color.secondaryContainer(compatibleWith: traitCollection)
        }
    }

    @IBAction func buttonTapped() {
        delegate?.onButtonTapped(type: type)
    }
}

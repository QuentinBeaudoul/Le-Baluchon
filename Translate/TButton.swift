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
    func onButtonTapped(sender: UIButton, type: TButtonType?)
}

enum TButtonType {
    case source
    case target
}

class TButton: LoadableView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: TButtonDelegate?
    var type: TButtonType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

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

    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.onButtonTapped(sender: sender, type: type)
    }
}

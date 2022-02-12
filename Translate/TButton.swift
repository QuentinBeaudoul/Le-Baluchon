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

    weak var delegate: TButtonDelegate?
    var type: TButtonType?

    func fillView(title: String?, type: TButtonType) {
        self.type = type
        label.text = title

        switch type {
        case .source:
            label.textColor = Exposed.ressources.color.onPrimaryContainer()
            imageView.tintColor = Exposed.ressources.color.onPrimaryContainer()
            backgroundColor = Exposed.ressources.color.primaryContainer()
        case .target:
            label.textColor = Exposed.ressources.color.onSecondaryContainer()
            imageView.tintColor = Exposed.ressources.color.onSecondaryContainer()
            backgroundColor = Exposed.ressources.color.secondaryContainer()
        }
    }

    @IBAction func buttonTapped() {
        delegate?.onButtonTapped(type: type)
    }
}

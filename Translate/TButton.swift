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
    func onActionTapped(action: UIAction, type: TButtonType?)
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

    func fillView(title: String?, langs: [String], type: TButtonType) {
        self.type = type
        label.text = title

        switch type {
        case .source:
            label.textColor = Extension.R.color.onPrimaryContainer()
            imageView.tintColor = Extension.R.color.onPrimaryContainer()
            view.backgroundColor = Extension.R.color.primaryContainer(compatibleWith: traitCollection)
            button.menu = UIMenu(title: "Source", children: [UIMenuElement]())
            updateMenu(langs)
        case .target:
            label.textColor = Extension.R.color.onSecondaryContainer()
            imageView.tintColor = Extension.R.color.onSecondaryContainer()
            view.backgroundColor = Extension.R.color.secondaryContainer(compatibleWith: traitCollection)
            button.menu = UIMenu(title: "Target", children: [UIMenuElement]())
            updateMenu(langs)
        }
    }
    
    func updateLabel(text: String?) {
        label.text = text
    }
    
    func updateMenu(_ langs: [String]) {
        var actions = [UIAction]()
        for lang in langs {
            actions.append(UIAction(title: lang, handler: { action in
                self.delegate?.onActionTapped(action: action, type: self.type)
            }))
        }
        button.menu?.replacingChildren(actions)
    }
}

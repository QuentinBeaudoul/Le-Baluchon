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
    @available(iOS 14.0, *)
    func onActionTapped(action: UIAction, type: TButtonType?)
    
    func onActionTapped(actionSheet: UIAlertController)
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
    var actionSheetController: UIAlertController?

    func fillView(title: String?, langs: [String], type: TButtonType) {
        self.type = type
        label.text = TranslateManager.shared.getLiteralName(for: title ?? "")

        switch type {
        case .source:
            label.textColor = Extension.R.color.onPrimaryContainer()
            imageView.tintColor = Extension.R.color.onPrimaryContainer()
            view.backgroundColor = Extension.R.color.primaryContainer(compatibleWith: traitCollection)
            if #available(iOS 14.0, *) {
                button.menu = UIMenu(title: "Source", children: [UIAction]())
            } else {
                actionSheetController = UIAlertController(title: "Source", message: nil, preferredStyle: .actionSheet)
            }
            updateMenu(langs)
        case .target:
            label.textColor = Extension.R.color.onSecondaryContainer()
            imageView.tintColor = Extension.R.color.onSecondaryContainer()
            view.backgroundColor = Extension.R.color.secondaryContainer(compatibleWith: traitCollection)
            if #available(iOS 14.0, *) {
                button.menu = UIMenu(title: "Target", children: [UIAction]())
                button.showsMenuAsPrimaryAction = true
            } else {
                actionSheetController = UIAlertController(title: "Target", message: nil, preferredStyle: .actionSheet)
            }
            updateMenu(langs)
        }
    }
    
    func updateLabel(text: String?) {
        label.text = TranslateManager.shared.getLiteralName(for: text ?? "")
    }
    
    func updateMenu(_ langs: [String]) {
        if #available(iOS 14.0, *) {
            var actions = [UIAction]()
            for lang in langs {
                actions.append(UIAction(title: TranslateManager.shared.getLiteralName(for: lang), handler: { action in
                    self.delegate?.onActionTapped(action: action, type: self.type)
                }))
            }
            button.menu = button.menu?.replacingChildren(actions)
        } else {
            var actions = [UIAlertAction]()
            for lang in langs {
                actions.append(UIAlertAction(title: lang, style: .default, handler: { action in
                    guard let actionSheetController = self.actionSheetController else { return }
                    self.delegate?.onActionTapped(actionSheet: actionSheetController)
                }))
            }
        }
    }
}

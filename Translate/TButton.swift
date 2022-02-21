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
    
    func onActionTapped(type: TButtonType?)
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
        
        if #available(iOS 13.0, *) {} else {
            imageView.setImage(R.image.chevronDown(), with: nil)
        }

        switch type {
        case .source:
            label.textColor = R.color.onPrimaryContainer()
            imageView.tintColor = R.color.onPrimaryContainer()
            view.backgroundColor = R.color.primaryContainer(compatibleWith: traitCollection)
            if #available(iOS 14.0, *) {
                button.menu = UIMenu(title: "Source", children: [UIAction]())
                button.showsMenuAsPrimaryAction = true
                updateMenu(langs)
            }
            
        case .target:
            label.textColor = R.color.onSecondaryContainer() ?? .black
            imageView.tintColor = R.color.onSecondaryContainer()
            view.backgroundColor = R.color.secondaryContainer(compatibleWith: traitCollection) ?? .gray
            if #available(iOS 14.0, *) {
                button.menu = UIMenu(title: "Target", children: [UIAction]())
                button.showsMenuAsPrimaryAction = true
                updateMenu(langs)
            }
        }
    }

    func updateLabel(text: String?) {
        label.text = TranslateManager.shared.getLiteralName(for: text ?? "")
    }
    
    @available(iOS 14.0, *)
    func updateMenu(_ langs: [String]) {
        var actions = [UIAction]()
        for lang in langs {
            actions.append(UIAction(title: TranslateManager.shared.getLiteralName(for: lang), handler: { action in
                self.delegate?.onActionTapped(action: action, type: self.type)
            }))
        }
        button.menu = button.menu?.replacingChildren(actions)
    }
    
    @IBAction func buttonTapped() {
        guard #available(iOS 14.0, *) else {
            self.delegate?.onActionTapped(type: type)
            return
        }
    }
}

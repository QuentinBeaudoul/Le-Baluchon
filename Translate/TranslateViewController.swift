//
//  TranslateViewController.swift
//  Translate
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import Extension

class TranslateViewController: UIViewController {

    @IBOutlet weak var sourceButton: TButton!
    @IBOutlet weak var targetButton: TButton!
    @IBOutlet weak var textfield: TTextfield!
    @IBOutlet weak var noResultView: UIView!
    @IBOutlet weak var resultView: TLabel!
    @IBOutlet weak var switchImageView: UIImageView!
    
    let viewModel = TranslateViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        switchImageView.setImage(R.image.switch(), with: Extension.R.color.onTertiaryContainer())
        
        sourceButton.fillView(title: viewModel.source, langs: viewModel.getSourceLangs(), type: .source)
        targetButton.fillView(title: viewModel.target, langs: viewModel.getTargetLangs(for: viewModel.source), type: .target)
        initTargetButton(source: viewModel.source)
        
        sourceButton.delegate = self
        targetButton.delegate = self
        textfield.delegate = self
    }
    
    func initTargetButton(source: String) {
        let langs = viewModel.getTargetLangs(for: source)
        let defaultLang = langs.first
        
        viewModel.setTarget(with: defaultLang)
        targetButton.updateLabel(text: defaultLang)
        targetButton.updateMenu(langs)
    }

    func switchLangs() {
        guard let target = viewModel.target else { return }
        viewModel.swapSourceTraget(safeTarget: target)
        
        sourceButton.updateLabel(text: viewModel.source)
        
        targetButton.updateLabel(text: viewModel.target)
        targetButton.updateMenu(viewModel.getTargetLangs(for: viewModel.source))
    }
    
    @IBAction func switchButtonTapped() {
        switchLangs()
    }
}

extension TranslateViewController: TTextfieldDelegate {
    func onButtonTapped(text: String?) {
        
        guard let _ = viewModel.target else {
            UIAlertController.showAlert(title: "Target language", message: "Please select a taget language", on: self)
            return
        }
        
        guard let text = text, !text.isEmpty else {
            UIAlertController.showAlert(title: "Missing Text", message: "Text is needed to process translations", on: self)
            return
        }
        
        textfield.showLoader(true)
        viewModel.processTranslation(text: text) { result in
            self.textfield.showLoader(false)
            switch result {
            case .success(let translation):
                self.noResultView.isHidden = true
                self.resultView.isHidden = false
                self.resultView.setLabel(text: translation)
            case .failure(let error):
                UIAlertController.showAlert(title: "Error !", message: error.localizedDescription, on: self)
            }
        }
    }
}

extension TranslateViewController: TButtonDelegate {
    
    func onActionTapped(action: UIAction, type: TButtonType?) {
        guard let type = type else { return }
        let chosenLang = TranslateManager.shared.getNameFromLiteral(for: action.title)
        switch type {
        case .source:
            viewModel.setSource(with: chosenLang)
            sourceButton.updateLabel(text: chosenLang)
            
            initTargetButton(source: chosenLang)
        case .target:
            viewModel.setTarget(with: chosenLang)
            targetButton.updateLabel(text: chosenLang)
        }
    }
}

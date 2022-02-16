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
        switchImageView.setImage(R.image.switch(), with: Extension.R.color.onTertiaryContainer())
        sourceButton.fillView(title: viewModel.source, langs: viewModel.getSourceLangs(), type: .source)
        targetButton.fillView(title: viewModel.target, type: .target)
        
        sourceButton.delegate = self
        targetButton.delegate = self
        textfield.delegate = self
    }

    @IBAction func switchButtonTapped() {
    }
}

extension TranslateViewController: TTextfieldDelegate {
    func onButtonTapped(text: String?) {
        
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

        switch type {
        case .source:
            <#code#>
        case .target:
            <#code#>
        }
    }
}

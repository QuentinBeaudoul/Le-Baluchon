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
        sourceButton.delegate = self
        targetButton.delegate = self
    }

    @IBAction func switchButtonTapped() {
    }
}

extension TranslateViewController: TButtonDelegate {

    func onButtonTapped(type: TButtonType?) {
        guard let type = type else { return }

        switch type {
        case .source:
            print() 
        case .target:
            print()
        }
    }
}

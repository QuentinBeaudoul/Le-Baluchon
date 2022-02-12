//
//  File.swift
//  Translate
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import Foundation
import LoadableViews

protocol TTextfieldDelegate: AnyObject {
    func onButtonTapped()
}

class TTextfield: LoadableView {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var button: UIButton!

    weak var delegate: TTextfieldDelegate?

    @IBAction func buttonTapped() {
        delegate?.onButtonTapped()
    }
}

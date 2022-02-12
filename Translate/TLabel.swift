//
//  TLabel.swift
//  Translate
//
//  Created by Quentin Beaudoul on 12/02/2022.
//

import Foundation
import LoadableViews

class TLabel: LoadableView {

    @IBOutlet weak var label: UILabel!

    func setLabel(text: String?) {
        label.text = text
    }
}

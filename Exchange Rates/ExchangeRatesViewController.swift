//
//  ExchangeRatesViewController.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import Extension

class ExchangeRatesViewController: UIViewController {

    @IBOutlet weak var noRatesView: UIView!
    @IBOutlet weak var noRatesImageView: UIImageView!
    @IBOutlet weak var noRatesActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!

    let viewModel = ExchangeRatesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // No rates stuff
        noRatesImageView.setImage(R.image.ic_100_no_rates(), with: R.color.primary())
        noRatesView.isHidden = viewModel.hasExchangeRates()
        
    }

    private func updateUI() {
        eurLabel.text = viewModel.source
        usdLabel.text = viewModel.target
    }

    @IBAction func dialButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            viewModel.updateSource(",")
        case 11:
            viewModel.clear()
        default:
            let char = String(sender.tag)
            viewModel.updateSource(char)
            viewModel.convert()
        }

        updateUI()
    }

    @IBAction func noRatesButtonTapped(_ sender: UIButton) {
        noRatesActivityIndicator.isHidden = false
        sender.isEnabled = false

        viewModel.reloadRates { result in
            self.noRatesActivityIndicator.isHidden = true
            sender.isEnabled = true

            switch result {
            case .success():
                self.noRatesView.isHidden = true
            case .failure(_):
                UIAlertController.showAlert(title: "Error", message: "We can't help you anymore 😞", on: self)
            }
        }
    }
}

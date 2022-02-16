//
//  ExchangeRatesViewController.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit

class ExchangeRatesViewController: UIViewController {

    let viewModel = ExchangeRatesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !ExchangeRatesManager.shared.isExchangeRateAvailable() {
            UIAlertController.showAlert(title: "API Exchange Rates unavailable", message: "Api status is probably down", on: self)
        }
    }
}

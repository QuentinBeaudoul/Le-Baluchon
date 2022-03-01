//
//  SplashViewController.swift
//  Le Baluchon
//
//  Created by Quentin on 21/02/2022.
//

import UIKit
import Translate
import ExchangeRates

class SplashViewController: UIViewController {

    @IBOutlet weak var loaderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loaderView.applyActivityIndicator()
        
        ExchangeRatesManager.shared.fetchRates { _ in }
        
        TranslateManager.shared.fetchLanguages { _ in
            DispatchQueue.main.async {
                let mainVC = MainTabbarController.makeFromStoryboard("Main")
                mainVC.modalPresentationStyle = .overFullScreen
                self.present(mainVC, animated: true)
            }
        }
    }
}

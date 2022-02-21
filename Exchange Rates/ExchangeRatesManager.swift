//
//  ExchangeRatesManager.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import Extension
import LBNetwork

public final class ExchangeRatesManager {
    public static let shared = ExchangeRatesManager()
    private init() {}
    
    private(set) var usd: Double?

    public func getViewController() -> UIViewController {
        let viewController = ExchangeRatesViewController.makeFromStoryboard(in: Bundle(for: Self.self))
        if #available(iOS 13.0, *) {
            viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "eurosign.square"), selectedImage: UIImage(systemName: "eurosign.square.fill"))
        } else {
            let image = R.image.ic_24_euro()
            let selectedImage = R.image.ic_24_euro_fill()
            viewController.tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
        }

        return viewController
    }
    
    public func fetchRates(completion: ((Result<Double, Error>) -> Void)? = nil) {
        let url = Constante.exchangeRatesUrl
        let parameters = ["access_key": Constante.apikey]
        
        NetworkManager.fetchData(url: url, parameters: parameters, parser: ExchangeRatesContainer.self) { result in
            switch result {
            case .success(let container):
                if let usd = container?.rates.usd {
                    self.usd = usd
                    completion?(.success(usd))
                }
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func getUsdRate() -> Double? {
        return usd
    }
    
    func isExchangeRateAvailable() -> Bool {
        return usd != nil
    }
}

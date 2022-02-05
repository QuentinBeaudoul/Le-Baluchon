//
//  WeatherViewController.swift
//  Weather
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit

class WeatherViewController: UIViewController {

    let viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(systemName: "cloud.sun.rain")
        let selectedImage = UIImage(systemName: "cloud.sun.rain.fill")
        tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
    }
}

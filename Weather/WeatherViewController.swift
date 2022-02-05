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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

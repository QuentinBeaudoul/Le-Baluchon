//
//  TranslateViewController.swift
//  Translate
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit

class TranslateViewController: UIViewController {

    let viewModel = TranslateViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(systemName: "captions.bubble")
        let selectedImage = UIImage(systemName: "captions.bubble.fill")
        tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
    }
}

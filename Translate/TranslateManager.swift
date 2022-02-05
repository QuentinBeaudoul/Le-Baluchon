//
//  TranslateManager.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit

public final class TranslateManager {
    public static let shared = TranslateManager()
    private init() {}

    public func getViewController() -> UIViewController {
        return TranslateViewController()
    }
}

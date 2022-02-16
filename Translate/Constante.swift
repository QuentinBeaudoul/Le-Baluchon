//
//  Constante.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import Foundation

class Constante {
    static let apikey = "46eeaf92-d5b0-e7c3-464b-5f72f1ec5013:fx"
    static let translateUrl = "https://api-free.deepl.com/v2/translate"
    static let languagesUrl = "https://api-free.deepl.com/v2/glossary-language-pairs"
    static let authorization = "DeepL-Auth-Key \(apikey)"
    
    static let langDic = ["Fr": "Français",
                          "Es": "Español",
                          "En": "English",
                          "De": "Deutsch"]
}

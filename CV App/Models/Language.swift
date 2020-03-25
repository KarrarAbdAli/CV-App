//
//  Language.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Language {
    var name: String
    var level: languageLevel
    var isNative: Bool
    init(name: String, level: languageLevel, isNative: Bool = false){
        self.name = name
        self.level = level
        self.isNative = isNative
    }
}

enum languageLevel{
    case basic1
    case basic2
    case intermediate
    case advance
    case fluent
}

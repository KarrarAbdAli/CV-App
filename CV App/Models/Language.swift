//
//  Language.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Language: Decodable {
    var name: String
    var level: Int
    var isNative: Bool
    init(name: String, level: Int, isNative: Bool = false){
        self.name = name
        self.level = level
        self.isNative = isNative
    }
}

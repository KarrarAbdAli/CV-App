//
//  Strength.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Strength: Decodable{
    var cvItemTag: [String]
    init(cvItemTag: [String]){
        self.cvItemTag = cvItemTag
    }
}

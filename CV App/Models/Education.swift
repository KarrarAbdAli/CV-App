//
//  Education.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Education: Decodable {
    var degreeTitle: String
    var university: String
    var startDate: String
    var endDate: String
    
    init(degreeTitle: String, university: String, startDate: String, endDate: String) {
        self.degreeTitle = degreeTitle
        self.university = university
        self.startDate = startDate
        self.endDate = endDate
    }
}

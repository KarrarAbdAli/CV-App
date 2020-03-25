//
//  Education.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Education {
    var degreeTitle: String
    var university: String
    var startDate: Date
    var endDate: Date?
    init(degreeTitle: String, university: String, startDate: Date, endDate: Date?) {
        self.degreeTitle = degreeTitle
        self.university = university
        self.startDate = startDate
        self.endDate = endDate
    }
}

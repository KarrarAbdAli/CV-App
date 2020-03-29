//
//  Experience.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Experience: Decodable{
    var jobTitle: String
    var company: String
    var startDate: String
    var endDate: String
    var city: String
    var country: String
    var items: [String]
    
    init(jobTitle: String, company: String, startDate: String,endDate: String, city: String, country: String, items: [String]){
        
        self.jobTitle = jobTitle
        self.company = company
        self.startDate = startDate
        self.endDate = endDate
        self.city = city
        self.country = country
        self.items = items
    }
}

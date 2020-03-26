//
//  Title.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class Title: Decodable{
    let nameAndSurname: String
    var jobTitle: String?
    var email: String?
    var phoneNumber: Int?
    var address: String?
    var linkedIn: String?
    var skype: String?
    var git: String?
    init(nameAndSurname: String,
         jobTitle: String? = nil,
         email: String?,
         phoneNumber: Int? = nil,
         address: String? = nil,
         linkedIn: String? = nil,
         skype: String? = nil,
         git: String? = nil) {
        
        self.nameAndSurname = nameAndSurname
        self.jobTitle = jobTitle
        self.email = email
        self.phoneNumber = phoneNumber
        self.address = address
        self.linkedIn = linkedIn
        self.skype = skype
        self.git = git
    }
}

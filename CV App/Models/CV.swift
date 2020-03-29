//
//  CV.swift
//  CV App
//
//  Created by Karrar Abd Ali on 26/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class CV:Decodable{
    var title: Title
    var experience: [Experience]
    var strength: Strength
    var Language: [Language]
    var education: [Education]
    
    init(title: Title, experience: [Experience], strength: Strength, Language: [Language], education: [Education]) {
        self.title = title
        self.experience = experience
        self.strength = strength
        self.Language = Language
        self.education = education
    }
}

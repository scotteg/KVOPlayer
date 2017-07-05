//
//  Person.swift
//  KVO Player
//
//  Created by Scott Gardner on 7/5/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit

@objcMembers class Person: NSObject {
    
    dynamic var firstName: String
    dynamic var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init()
    }
    
    override var description: String {
        return "\(firstName) \(lastName)"
    }
}

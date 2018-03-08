//
//  UserInformation.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/13/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import RealmSwift

class UserInformation : Object {
    
    @objc dynamic var firstName = String()
    @objc dynamic var lastName = String()
    @objc dynamic var userName = String()
    @objc dynamic var phoneNumber = String()
    @objc dynamic var password = String()
    @objc dynamic var background = String()
    
    //var friendsList = List<UserInformation>()
}

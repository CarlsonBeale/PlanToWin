//
//  EventDetails.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/22/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import RealmSwift
class EventDetails : Object {
    
    @objc dynamic var title = String()
    @objc dynamic var location = String()
    @objc dynamic var startTime = String()
    @objc dynamic var endTime = String()
    
    var invitations = List<UserInformation>()
    
    var accepted = List<UserInformation>()
    var tentative = List<UserInformation>()
    var declined = List<UserInformation>()
}

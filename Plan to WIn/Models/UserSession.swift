//
//  UserSession.swift
//  Plan to WIn
//
//  Created by Christopher Zimmerman on 1/19/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import RealmSwift
class UserSession: Object {
    @objc dynamic var loggedInUser: UserInformation? = UserInformation()
}

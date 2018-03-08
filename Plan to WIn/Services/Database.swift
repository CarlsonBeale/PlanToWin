//
//  Database.swift
//  Plan to WIn
//
//  Created by Christopher Zimmerman on 2/6/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import RealmSwift

class Database {
    
    func allUsers() -> Results<UserInformation> {
        return (try! Realm(configuration: conf())).objects(UserInformation.self)
    }
    
    func write(codeBlock: () -> Void) {
        try! (try! Realm(configuration: conf())).write
        {
            codeBlock()
        }
    }
    
    func deleteAll() {
        write(codeBlock: {
          (try! Realm(configuration: conf())).deleteAll()
        })
    }
    
    func addUser(user: UserInformation) {
        write(codeBlock: {
            try! Realm(configuration: conf()).add(user)
        })
    }
    
    func addEvent(event: EventDetails) {
        write(codeBlock: {
            try! Realm(configuration: conf()).add(event)
        })
    }
    
    public func conf() -> Realm.Configuration
    {
        return Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 4,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 4) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })
    }
}

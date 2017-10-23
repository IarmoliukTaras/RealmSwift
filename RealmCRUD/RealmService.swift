//
//  RealmService.swift
//  RealmCRUD
//
//  Created by 123 on 23.10.17.
//  Copyright © 2017 123. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    
    private init() {}
    
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    
}

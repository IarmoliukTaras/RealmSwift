//
//  PickUpLine.swift
//  RealmCRUD
//
//  Created by 123 on 23.10.17.
//  Copyright © 2017 123. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class PickUpLine: Object {
    
    dynamic var line: String = ""
    let score = RealmOptional<Int>()
    dynamic var email: String? = nil
    
    convenience init(line: String, score: Int?, email: String?) {
        self.init()
        self.line = line
        self.score.value = score
        self.email = email
    }
    
    func scoreString() -> String? {
        guard let score = score.value else { return nil}
        return String(score)
    }
}

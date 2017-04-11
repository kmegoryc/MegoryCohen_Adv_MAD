//
//  Entry.swift
//  Diary
//
//  Created by Keren Megory-Cohen on 4/11/17.
//  Copyright © 2017 Keren Megory-Cohen. All rights reserved.
//

import Foundation
import Firebase

class Entry {
    
    var date: String
    var summary: String
    var highlight: String
    var lowlight: String
    
    init(newdate: String, newsum: String, newhigh: String, newlow: String){
        date = newdate
        summary = newsum
        highlight = newhigh
        lowlight = newlow
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: String]
        date = snapshotValue["date"]!
        summary = snapshotValue["summary"]!
        highlight = snapshotValue["highlight"]!
        lowlight = snapshotValue["lowlight"]!
    }
}

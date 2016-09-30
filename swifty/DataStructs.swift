//
//  DataStructs.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/27/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

struct Project {
    let finished: Bool
    let success: Bool
    let mark: Int
    let name: String
    
    init?(status:String, final_mark:Int, name:String) {
        self.name = name
        if final_mark < 0 {
            return nil
        }
        self.mark = final_mark
        if status == "finished" {
            finished = true
            success = final_mark > 80
        }
        else {
            finished = false
            success = false
        }
    }
  /* {
    "id": 260478,
    "occurrence": 0,
    "final_mark": 125,
    "status": "finished",
    "validated?": true,
    "current_team_id": 1282802,
    "project": {
    "id": 700,
    "name": "Dr Quine",
    "slug": "dr-quine"
    } */
}

struct Skill {
    let name: String
    let level: Float
    /* {
     "id": 16,
     "name": "Company experience",
     "level": 12.54
     } */
    
    init?(name:String, lvl:Float) {
        if lvl < 0 {
            return nil
        }
        self.name = name
        self.level = lvl
        
    }

}

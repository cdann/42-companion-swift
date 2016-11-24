//
//  DataStructs.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/27/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class Project {
    let mark: Int
    let name: String
    let status :String

    
    init?(Json:[String: AnyObject]) {
        if let finished = Json["status"] as? String,
          let success = Json["validated?"] as? Bool,
          let mrk = Json["final_mark"] as? Int,
          var nm = Json["project"]?["name"] as? String {
            if finished == "finished" && success {
                status = "Success"
            } else if finished != "finished" {
                status = "In progress"
            } else {
                status = "Failed"
            }
            if (nm.containsString("Day") || nm.containsString("Rush")), let slug = Json["project"]?["slug"] as? String {
                if (slug.containsString("cpp")){
                    nm += " cpp"
                }
                else if (slug.containsString("ocaml")){
                    nm += " ocaml"
                }
                else if (slug.containsString("php")){
                    nm += " php"
                }
                else if (slug.containsString("unity")){
                    nm += " unity"
                }
                else if (slug.containsString("swift")){
                    nm += " swift"
                }
                else if (slug.containsString("python")){
                    nm += " python"
                }
            }
            name = nm
            mark = mrk
        } else if let nm = Json["project"]?["name"]as? String {
            self.name = nm
            let stat = Json["status"] as? String
            if stat  == "in_progress" || stat == "waiting_for_correction"{
                self.status = "In progress"
            }
            else {
                print (Json["status"] as? String)
                self.status = "null"
            }
            self.mark = 0
        }
        else {
            if let _ = Json["status"] as? String {
                print("status ok")
            }
            if let _ = Json["validated?"] as? Bool {
                print("validated? ok")
            }
            if let _ = Json["final_mark"] as? Int {
                print("final_mark? ok")
            }
            if let _ = Json["project"]?["name"] as? String {
                print("name ok")
            }
            return nil
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

class Skill {
    let name: String
    let level: Float
    
    
    init?(name:String, lvl:Float) {
        if lvl < 0 {
            return nil
        }
        self.name = name
        self.level = lvl
        
    }
    
    init?(Json:[String: AnyObject]) {
        if let nme = Json["name"] as? String, let lvl = Json["level"] as? Float {
            self.name = nme
            self.level = lvl
        } else {
            if let _ = Json["name"] as? String {
                print("name ok")
            }
            if let _ = Json["level"] as? Float {
                print("level ok")
            }
            return nil
        }
    }

}
/* {
 "id": 16,
 "name": "Company experience",
 "level": 12.54
 } */

struct Info {
    let tel:String?
    let mail: String
    let level: Float
    let display_name : String
    let url_image : String
}

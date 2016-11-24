//
//  User.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/26/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class User : CustomStringConvertible {
    var login:String
    
    var skills = [Skill]()
    var projects = [Project]()
    
    let info:Info
    var image:UIImage?

    var description: String {
        get{
            var str = "User:"
            str += login+"\n"
            str += info.mail+"\n"
            str += String(skills.count)+"\n"
            str += String(projects.count)+"\n"
            str += "*******************\n"
            return str
        }
    }
    
    
    
    init?(values:[String: AnyObject]) {
        if let log = values["login"] as? String ,
          let mail = values["email"] as? String,
          let name = values["displayname"] as? String ,
          let img = values["image_url"] as? String,
          let cursus = values["cursus_users"] as? [[String: AnyObject]] ,
          let proj = values["projects_users"] as? [[String: AnyObject]]{
            login = log
            for pr in proj {
                if let p = Project(Json:pr) {
                    self.projects.append(p)
                }
                else {
                    print("project Malformed data :"+String(pr))
                    return nil
                }
            }
            var lv : Float = -1
            for curs in cursus {
                if let name = curs["cursus"]?["name"] as? String where name == "42",
                    let lvl = curs["level"] as? Float,
                    let skl = curs["skills"] as? [[String: AnyObject]] {
                    lv = lvl
                    for sk in skl {
                        if let s = Skill(Json:sk) {
                            self.skills.append(s)
                        }
                        else {
                            print("skills Malformed data :"+String(sk))
                            return nil
                        }
                    }
                }

            }
            
            
            if let phone = values["phone"] as? String {
                self.info = Info(tel: phone, mail:mail, level:lv, display_name:name, url_image:img)
            } else {
                self.info = Info(tel: nil, mail:mail, level:lv, display_name:name, url_image:img)
            }
            if  lv == -1{
                print("cursus_user Malformed data")
                return nil
            }
            
        }
        else {
            print("user Malformed data :")
            /*if let _ = values["login"] as? Stringvar                print("login ok")
            }
            if let _ = values["email"] as? String {
                print("email ok")
            }
            if let _ = values["phone"] as? String {
                print("phone ok")
            }
            if let _ = values["displayname"] as? String {
                print("displayname ok")
            }
            if let _ = values["image_url"] as? String {
                print("image_url ok")
            }
            if let _ = values["cursus_users"] as? [[String: AnyObject]] {
                print("cursus_users ok")
            }
            if let _ = values["projects_users"] as? [AnyObject] {
                print("project_users ok ")
            }*/
            return nil
        }
    }
}

/*
{
 "email": "codooku@student.42.fr",
 "login": "codooku",
 "phone": null,
 "displayname": "Count Dooku",
 "image_url": "https://cdn.intra.42.fr/images/empty.png",
 "cursus_users": [{
    "level": 0.0,
    "skills": [],
 }],
 "projects_users": [],
}*/

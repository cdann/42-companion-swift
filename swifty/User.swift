//
//  User.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/26/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class User {
    var login:String
    var url_image:String
    var skills = [Skill]()
    var projects = [Project]()
    /*
    let tel:String
    let mail: String
    let wallet: Int
    let correction_points : Int*/
    
    init?(login: String, url_image: String, projects: [Project], skills: [Skill]) {
        self.login = login
        if login.isEmpty {
            return nil
        }
        self.url_image = url_image
        self.projects = projects
        self.skills = skills
    }
}
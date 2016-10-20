//
//  SkillTableViewCell.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/27/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    var skill:Skill?{
        didSet {
            name.text = skill!.name
            level.text = String(skill!.level)
            let prog = skill!.level % 1
            progress.progress = prog
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

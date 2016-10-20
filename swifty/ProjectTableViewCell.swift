//
//  ProjectTableViewCell.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/27/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var mark: UILabel!
    
    var project : Project? {
        didSet {
            name.text = project!.name
            status.text = project!.status
            mark.text = String(project!.mark)
            setcolour(project!.status)
        }
    }
    
    let colours = [
         UIColor(colorLiteralRed: 198/255, green:131/255 , blue: 120/255, alpha: 1),
          UIColor(colorLiteralRed: 94/255, green: 118/255, blue: 198/255, alpha: 1),
           UIColor(colorLiteralRed: 184/255, green: 55/255, blue: 40/255, alpha: 1)
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setcolour(stat:String) {
        var clr: UIColor!
        if (stat == "Success") {
            clr = colours[1]
        } else if (stat == "Failed") {
            clr = colours[2]
        } else {
            clr = colours[0]
        }
        status.textColor = clr
    }

}

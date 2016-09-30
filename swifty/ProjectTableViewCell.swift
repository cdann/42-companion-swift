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
    
    func setcolour(finished: Bool, success: Bool ) {
        var clr: UIColor!
        if (success) {
            clr = colours[1]
        } else if (finished) {
            clr = colours[2]
        } else {
            clr = colours[0]
        }
        status.textColor = clr
    }

}

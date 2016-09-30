//
//  HeaderSection.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/27/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class HeaderSection: UITableViewHeaderFooterView {
    @IBOutlet weak var SectionName: UILabel!

    @IBOutlet weak var HeaderSection: UIStackView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        let image = UIImage(named: "confectionary")!
        self.backgroundColor = UIColor(patternImage: image)
    }
    


}

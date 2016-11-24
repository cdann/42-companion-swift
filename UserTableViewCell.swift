//
//  UserTableViewCell.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/26/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var UserLogin: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var lvlLabel: UILabel!
    
    
    var info:Info! {
        didSet {
            loadImage(info.url_image)
            nameLabel.text = info.display_name
            telLabel.text = info.tel
            mailLabel.text = info.mail
            lvlLabel.text = "level "+String(info.level)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadImage(url_image:String) {
        let url = NSURL(string: url_image )
        if let data = NSData(contentsOfURL: url!){ //make sure your image in this url does exist, otherwise unwrap in a if let check{
            let img = UIImage(data: data)!
            UserImage.image = img
        }

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

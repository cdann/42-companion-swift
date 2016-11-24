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
    
   /* func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let contextImage: UIImage = UIImage(CGImage: image.CGImage!)
        
        let contextSize: CGSize = contextImage.size
        
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRectMake(posX, posY, cgwidth, cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(CGImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }*/

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

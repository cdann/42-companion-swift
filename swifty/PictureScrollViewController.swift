//
//  PictureScrollViewController.swift
//  swifty
//
//  Created by Celine DANNAPPE on 10/20/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class PictureScrollViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView:UIImageView?
    var image:UIImage? 
    
    
    override func viewDidLoad() {
        let back = UIImage(named: "confectionary")!
        self.view.backgroundColor = UIColor(patternImage: back)
        super.viewDidLoad()
        scrollView.delegate = self
        if let img = image {
            imageView = UIImageView(image: img)
            scrollView.addSubview(imageView!)
            scrollView.contentSize = imageView!.frame.size
            scrollView.maximumZoomScale = 50
            scrollView.minimumZoomScale = 0.5
        }
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

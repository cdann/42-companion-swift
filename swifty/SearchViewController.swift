//
//  SearchViewController.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/26/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var SearchButton: UIButton!
    
    var login: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://randomuser.me/api/" )
        let data = NSData(contentsOfURL: url!)
        print(data)
        let image = UIImage(named: "confectionary")!
        self.view.backgroundColor = UIColor(patternImage: image)
        let placeholdercolor = UIColor(colorLiteralRed: 0.34, green: 0.54, blue: 0.47, alpha: 0.5)
        SearchField.attributedPlaceholder = NSAttributedString(string:"user search",attributes:[NSForegroundColorAttributeName: placeholdercolor])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === SearchButton {
            print("ooo")
            login = SearchField.text
        }
    }


}


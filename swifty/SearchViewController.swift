//
//  SearchViewController.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/26/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate, ApiCallManagerDelegate {

    @IBOutlet weak var NotFoundLabel: UILabel!
    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    var user: User?
    let ApiManager = ApiCallManager()
    
    override func viewDidLoad() {
        SearchField.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "confectionary")!
        self.view.backgroundColor = UIColor(patternImage: image)
        let placeholdercolor = UIColor(colorLiteralRed: 0.34, green: 0.54, blue: 0.47, alpha: 0.5)
        SearchField.attributedPlaceholder = NSAttributedString(string:"user search",attributes:[NSForegroundColorAttributeName: placeholdercolor])
        SearchField.autocorrectionType = UITextAutocorrectionType.No
        ApiManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? UserTableViewController {
                destination.user = self.user!
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        SearchField.resignFirstResponder()
        launchSearch()
        return true
    }
    
    
    func launchSearch() {
        if let txt =  SearchField.text where txt != "" {
            NotFoundLabel.hidden = true
            loadingSpinner.startAnimating()
            ApiManager.searchUser(txt)
        }
    }
    
    func treatResponse(response:AnyObject?) {
        if let usr = response as? User {
            self.user = usr
            print(self.user)
            self.performSegueWithIdentifier("showUser", sender:self)
        }
        else {
            dispatch_async(dispatch_get_main_queue()) {
                self.NotFoundLabel.hidden = false
            }
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.loadingSpinner.stopAnimating()
        }
    }

    
    func handleErrors(msg:String) {
        let alertController = UIAlertController(title: "Error", message:
            msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}


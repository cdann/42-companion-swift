//
//  UserTableViewController.swift
//  swifty
//
//  Created by Celine DANNAPPE on 9/26/16.
//  Copyright © 2016 Celine DANNAPPE. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    // MARK: Properties
    var user:User!
    
    let sections = ["informations", "skills", "projets"]
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let image = UIImage(named: "confectionary")!
        self.view.backgroundColor = UIColor(patternImage: image)
        tableView.registerNib(UINib(nibName: "separator", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderSection")
        self.tableView.estimatedRowHeight = 100.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()

         //Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (user == nil)
        {
            return 0
        }
        let rownbs=[1, user.skills.count, user.projects.count]
        return rownbs[section]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toImage", let ctr = segue.destinationViewController as? PictureScrollViewController {
            ctr.image = user.image
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("UserInfoCell", forIndexPath: indexPath) as! UserTableViewCell
            cell.UserLogin.text = user.login
            
            cell.info = user.info
            user.image = cell.UserImage.image
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("skillCell", forIndexPath: indexPath) as! SkillTableViewCell
            cell.skill = user.skills[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath) as! ProjectTableViewCell
            cell.project = user.projects[indexPath.row]
            return cell
            
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("HeaderSection") as! HeaderSection
        headerView.SectionName.text = sections[section]  // set this however is appropriate for your app's model
        return headerView
    }
    

}

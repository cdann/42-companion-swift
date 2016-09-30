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
    
    func loadUser() -> User {
        let skills = [Skill(name: "Company experience", lvl: 12.5)!, Skill(name: "Super power", lvl: 9)!]
        let projects = [Project(status: "finished", final_mark: 125, name: "Quine")!, Project(status: "in_progress", final_mark: 0, name: "Cleaning room")!]
        return User(login:"cdannapp", url_image: "https://cdn.intra.42.fr/users/cdannapp.jpg", projects: projects, skills: skills)!
    }
    
    @IBAction func getSearchResult(sender: UIStoryboardSegue) {
        print("plouf")
        if let sourceViewController = sender.sourceViewController as? SearchViewController, search = sourceViewController.login {
            self.user = self.loadUser()
            self.user.login = search
            
            let newIndexPath = NSIndexPath(forRow: 0, inSection: 0)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            
            for i in 0..<self.user.skills.count
             {
                let newIndexPath = NSIndexPath(forRow: i, inSection: 1)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            }
            
            for i in 0..<self.user.projects.count
            {
                let newIndexPath = NSIndexPath(forRow: i, inSection: 2)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
            }
            
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let image = UIImage(named: "confectionary")!
        self.view.backgroundColor = UIColor(patternImage: image)
        tableView.registerNib(UINib(nibName: "separator", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderSection")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        print("booo")
        if (user == nil)
        {
            print("paf")
            return 0
        }
        let rownbs=[1, user.skills.count, user.projects.count]
        return rownbs[section]
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cellIdentifier = "UserInfoCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UserTableViewCell
        
        
            cell.UserLogin.text = user.login
            cell.loadImage(user.url_image)
            return cell
        } else if indexPath.section == 1 {
            print(indexPath.section)
            let cell = tableView.dequeueReusableCellWithIdentifier("skillCell", forIndexPath: indexPath) as! SkillTableViewCell
            let skill = user.skills[indexPath.row]
            cell.name.text = skill.name
            let lvl = Int(skill.level)
            
            cell.level.text = String(lvl)
            let prog = skill.level % 1
            cell.progress.progress = prog
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath) as! ProjectTableViewCell
            let project = user.projects[indexPath.row]
            cell.name.text = project.name
            if(project.success) {
                cell.status.text = "Success"
            }
            else if(project.finished) {
                cell.status.text = "Failed"
            }
            else {
                cell.status.text = "In progress"
            }
            cell.mark.text = String(project.mark)
            cell.setcolour(project.finished, success: project.success)
            return cell
            
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier("HeaderSection") as! HeaderSection
        
        if (section != 0) {
            headerView.SectionName.text = sections[section]  // set this however is appropriate for your app's model
            return headerView
        }
        return nil
    }
    
   /* override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }*/
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 11/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import UIKit

class FriendListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var friends = [Friend]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Friends"
        initializeTheFriends();
        self.spinner.startAnimating();
    }
    
    func initializeTheFriends() {
        
        
        
        let url = NSURL(string: "http://159.203.113.84/api/user/1/friend")!;
        
        let session = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            (data, response, error) -> Void in
        
            if let rawData = data {
                let jsonResult: NSArray = NSJSONSerialization.JSONObjectWithData(rawData, options: NSJSONReadingOptions.MutableContainers, error: NSErrorPointer()) as! NSArray;
                
                for (var i = 0; i < jsonResult.count; i++) {
                    var resultData: NSDictionary! = (jsonResult[i] as! NSDictionary);
                    self.friends.append(Friend(id: resultData["id"] as! String, name: resultData["name"] as! String, thumbnails: resultData["thumb_url"] as! String, prepTime: "X years"));
                    println(resultData["name"]);
                    println(jsonResult.count);
                }
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.tableView?.reloadData();
                    self.spinner.stopAnimating();
                    self.spinner.hidden = true;
                    
                });
            }
           
            
        });
        
        session.resume();
        
    }
    
    // MARK: - UITableView DataSource Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "tableCell"

        var cell: TableCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableCell
        
        if cell == nil {
            cell = TableCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell.configurateTheFriendCell(friends[indexPath.row])
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            friends.removeAtIndex(indexPath.row)
            self.tableView?.reloadData()
            self.tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        
        }
    }
    
    //MARK: - UITableView Delegate Method
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "blogList" {
            let indexPath = self.tableView!.indexPathForSelectedRow
            //let destinationViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            let destinationViewController: BlogListVC = segue.destinationViewController as! BlogListVC;
            
            destinationViewController.friend = friends[indexPath()!.row];
            
            println("Testing!");
//            destinationViewController.prepString = friends[indexPath()!.row].prepTime
//            destinationViewController.nameString = friends[indexPath()!.row].name
//            destinationViewController.imageName = friends[indexPath()!.row].thumbnails
        }
    }
}

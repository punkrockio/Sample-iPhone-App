//
//  ViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 11/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    
    var friends = [Friend]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Friends"
        initializeTheFriends()
    }
    
    func initializeTheFriends() {
        self.friends = [
            Friend(name: "Becz Wallace", thumbnails: "becz.jpg", prepTime: "4 years"),
            Friend(name: "Joe Sanders", thumbnails: "joe.jpg", prepTime: "10 years"),
            Friend(name: "John Meikle", thumbnails: "john.jpg", prepTime: "10 years"),
            Friend(name: "Susie Mitchell", thumbnails: "sus.jpg", prepTime: "15 years"),
            Friend(name: "Hannah 'Bolo' Bryant", thumbnails: "bolo.jpg", prepTime: "2 years"),
            Friend(name: "Georgie Desalis", thumbnails: "george.jpg", prepTime: "2 years"),
        ]
        self.tableView?.reloadData()
    }
    
    // MARK: - UITableView DataSource Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "tableCell"

        var cell: TableCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableCell
        
        if cell == nil {
            cell = TableCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell.configurateTheCell(friends[indexPath.row])
        
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
        if segue.identifier == "friendDetail" {
            let indexPath = self.tableView!.indexPathForSelectedRow
            let destinationViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            destinationViewController.prepString = friends[indexPath()!.row].prepTime
            destinationViewController.nameString = friends[indexPath()!.row].name
            destinationViewController.imageName = friends[indexPath()!.row].thumbnails
        }
    }
}

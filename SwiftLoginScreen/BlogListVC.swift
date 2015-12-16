import UIKit

class BlogListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var blogs = [Blog]()
    var friend: Friend?;
    let api:String = "http://159.203.113.84/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Blogs"
        initializeTheBlogs();
        self.spinner.startAnimating();
    }
    
    func initializeTheBlogs() {
        
        
        var url:NSURL! = NSURL(string: "\(self.api)api/friend/" + friend!.id)!;
        
        var session = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            (data, response, error) -> Void in
            
            if let rawData = data {
                
                let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(rawData, options: NSJSONReadingOptions.MutableContainers, error: NSErrorPointer()) as! NSDictionary;
                println(jsonResult["posts"]);
                var posts: NSArray! = jsonResult["posts"] as! NSArray;
                
                println(posts.count);
                
                for (var i = 0; i < posts.count; i++) {
                    var post: NSDictionary! = posts[i] as! NSDictionary;
                    
                    println(post);
                    var thumbUrl = post["thumb_url"] as! String
                    
                    self.blogs.append(
                        Blog(authour: self.friend!,
                             title: post["title"] as! String,
                             subtitle: post["subtitle"] as! String,
//                             thumbnail: self.friend!.thumbnails,
//                             thumbnail: "http://159.203.113.84/\(thumbUrl)" ,
                            thumbnail: self.api + thumbUrl,
                             blurb: post["slug"] as! String,
                             fulltext: post["content_raw"] as! String
                        )
                    );
                    
                }
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.tableView?.reloadData();
                    self.spinner.stopAnimating();
                    self.spinner.hidden = true;
                });
            }
        
        })
        
        session.resume();
        
    }
    
    // MARK: - UITableView DataSource Methods
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "tableCell"
        
        var cell: TableCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableCell
        
        if cell == nil {
            cell = TableCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell.configurateTheBlogCell(blogs[indexPath.row])
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            blogs.removeAtIndex(indexPath.row)
            self.tableView?.reloadData()
            self.tableView?.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
            
        }
    }
    
    //MARK: - UITableView Delegate Method
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "blogDetail" {
            let indexPath = self.tableView!.indexPathForSelectedRow
            let destinationViewController: BlogDetailVC = segue.destinationViewController as! BlogDetailVC;
            
            
            destinationViewController.blogTitle    = blogs[indexPath()!.row].title;
            destinationViewController.blogSubtitle = blogs[indexPath()!.row].subtitle;
            destinationViewController.content      = blogs[indexPath()!.row].fulltext;
//            destinationViewController.imageName    = blogs[indexPath()!.row].authour.thumbnails;
            destinationViewController.imageName    = blogs[indexPath()!.row].thumbnail;
            
        }
    }
}

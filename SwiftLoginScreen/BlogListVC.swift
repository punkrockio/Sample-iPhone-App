import UIKit

class BlogListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    
    var blogs = [Blog]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Blogs"
        initializeTheBlogs()
    }
    
    func initializeTheBlogs() {
        self.blogs = [
//            Blog(name: "Becz Wallace", thumbnails: "becz.jpg", prepTime: "4 years"),
//            Blog(name: "Joe Sanders", thumbnails: "joe.jpg", prepTime: "10 years"),
//            Blog(name: "John Meikle", thumbnails: "john.jpg", prepTime: "10 years"),
//            Blog(name: "Susie Mitchell", thumbnails: "sus.jpg", prepTime: "15 years"),
//            Blog(name: "Hannah 'Bolo' Bryant", thumbnails: "bolo.jpg", prepTime: "2 years"),
//            Blog(name: "Georgie Desalis", thumbnails: "george.jpg", prepTime: "2 years"),
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
        
        cell.configurateTheCell(blogs[indexPath.row])
        
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
            let destinationViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
//            destinationViewController.prepString = blogs[indexPath()!.row].prepTime
//            destinationViewController.nameString = blogs[indexPath()!.row].name
//            destinationViewController.imageName = blogs[indexPath()!.row].thumbnails
        }
    }
}

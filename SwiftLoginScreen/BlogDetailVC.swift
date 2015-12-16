//
//  DetailViewController.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 12/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit

class BlogDetailVC: UIViewController {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var prepTime: UILabel?
    
    var nameString: String?
    var prepString: String?
    var imageName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = nameString!
        
//        imageView?.image = UIImage(named: imageName!)
        let url = NSURL(string: imageName!)!;
        let data = NSData(contentsOfURL: url);
        imageView?.image = UIImage(data: data!);
        
        nameLabel?.text = nameString!
        prepTime?.text = prepString!
        

        self.imageView?.layer.cornerRadius = 4.0
        self.imageView?.clipsToBounds = true
    }
}
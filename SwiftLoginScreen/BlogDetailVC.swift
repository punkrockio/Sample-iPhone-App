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
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var textView: UITextView?
    
    var imageName: String?;
    var blogTitle: String?;
    var blogSubtitle: String?;
    var content: String?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = blogTitle!
        titleLabel?.text = blogSubtitle!
        textView!.text = content;
//        imageView?.image = UIImage(named: imageName!)
        let url = NSURL(string: imageName!)!;
        let data = NSData(contentsOfURL: url);
        imageView?.image = UIImage(data: data!);
        
        
        

        self.imageView?.layer.cornerRadius = 4.0
        self.imageView?.clipsToBounds = true
    }
}
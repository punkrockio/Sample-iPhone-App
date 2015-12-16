//
//  TableCell.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 11/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit

class TableCell : UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var prepTimeLabel: UILabel?
    @IBOutlet var thumbnailImageView: UIImageView?
    
    
    @IBOutlet var thumbnailImageViewBlog: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var blurbLabel: UILabel!
    
    func configurateTheFriendCell(friend: Friend) {
        self.nameLabel?.text = friend.name
        self.prepTimeLabel?.text = friend.prepTime
        
        //let imageView:UIImage = UIImage(named: friend.thumbnails)!
        
        let url = NSURL(string: friend.thumbnails)!;
        let data = NSData(contentsOfURL: url);
        var imageView = UIImage(data: data!);
        
        self.thumbnailImageView?.image = imageView
        self.thumbnailImageView?.layer.cornerRadius = self.thumbnailImageView!.frame.size.width / 2
        self.thumbnailImageView?.clipsToBounds = true
    }
    
    func configurateTheBlogCell(blog: Blog) {
        self.titleLabel?.text = blog.title;
        self.blurbLabel?.text = blog.blurb;
        
//        let imageView:UIImage = UIImage(named:blog.thumbnail)!;
        let url = NSURL(string: blog.thumbnail)!;
        let data = NSData(contentsOfURL: url);
        var imageView = UIImage(data: data!);
        
        
        self.thumbnailImageViewBlog?.image = imageView;
        self.thumbnailImageViewBlog?.layer.cornerRadius = self.thumbnailImageViewBlog!.frame.size.width / 2;
        self.thumbnailImageViewBlog?.clipsToBounds = true;
    }
    
}
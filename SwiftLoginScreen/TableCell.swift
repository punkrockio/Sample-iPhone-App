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
    
    func configurateTheCell(friend: Friend) {
        self.nameLabel?.text = friend.name
        self.prepTimeLabel?.text = friend.prepTime
        
        let imageView:UIImage = UIImage(named: friend.thumbnails)!
        
        self.thumbnailImageView?.image = imageView
        self.thumbnailImageView?.layer.cornerRadius = self.thumbnailImageView!.frame.size.width / 2
        self.thumbnailImageView?.clipsToBounds = true
    }
    
}
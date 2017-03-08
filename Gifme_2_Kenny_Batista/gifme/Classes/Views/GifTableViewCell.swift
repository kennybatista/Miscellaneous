//
//  GifTableviewCell.swift
//  gifme
//
//  Created by Matt Greenwell on 12/20/16.
//  Copyright © 2016 William Kalish. All rights reserved.
//

import Foundation
import UIKit

class GifTableViewCell: UITableViewCell {
    @IBOutlet var gifImageView: GIFImageView?

    override func prepareForReuse() {
        gifImageView?.prepareForReuse()
        
    }
}

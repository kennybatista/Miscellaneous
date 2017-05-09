//
//  PublicTableViewCell.swift
//  iOSSeminarChallenge
//
//  Created by Kenny Batista on 2/17/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class PublicTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func starButton(_ sender: Any) {
        
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

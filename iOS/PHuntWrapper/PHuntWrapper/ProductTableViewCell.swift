//
//  ProductTableViewCell.swift
//  PHuntWrapper
//
//  Created by Kenny Batista on 2/27/17.
//  Copyright © 2017 kennybatista. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var numberOfVotesLabel: UILabel!
    
    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

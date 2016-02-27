//
//  VideoCell.swift
//  LocalVideos
//
//  Created by Edouard Jamin on 25/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

	@IBOutlet weak var backgroundImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

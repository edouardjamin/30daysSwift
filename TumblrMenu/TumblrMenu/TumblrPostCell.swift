//
//  TumblrPostCell.swift
//  TumblrMenu
//
//  Created by Edouard Jamin on 07/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

// Structure
struct posts {
	let avatarImage :UIImage
	let avatarName :String
	let sharedImage :UIImage
}

class TumblrPostCell: UICollectionViewCell {

	// Interface
	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var avatarName: UILabel!
	@IBOutlet weak var sharedImage: UIImageView!
	
}

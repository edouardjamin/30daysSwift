//
//  CarouselCell.swift
//  Carousel
//
//  Created by Edouard Jamin on 28/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

struct item {
	let image :UIImage
	let title :String
}

class CarouselCell: UICollectionViewCell {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
    
	@IBOutlet weak var blurEffect: UIVisualEffectView!
}

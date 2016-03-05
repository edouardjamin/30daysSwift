//
//  TipInCellAnimator.swift
//  Day 13 - AnimatedTableView
//
//  Created by Edouard Jamin on 05/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import Foundation
import UIKit

class TipInCellAnimator {
	
	class func animate(cell :UITableViewCell, view :UIView) {
		
		// Retain cell Y position
		
		
		cell.frame.origin.y -= view.frame.height
		
		UIView.animateWithDuration(1, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveLinear, animations: {
			cell.transform = CGAffineTransformMakeTranslation(0, view.frame.height)
			}, completion: nil)
		
	}
}



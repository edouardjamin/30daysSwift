//
//  ViewControllerMenu.swift
//  TumblrMenu
//
//  Created by Edouard Jamin on 07/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewControllerMenu: UIViewController {
	
	// Interface
	@IBOutlet weak var textView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		self.textView.bounds.origin.x -= self.textView.bounds.origin.x
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewWillAppear(animated)
	}

	// UI Status Bar
	override func prefersStatusBarHidden() -> Bool {
		return true
	}

}

//
//  ViewController.swift
//  Day 16 - Slide Menu
//
//  Created by Edouard Jamin on 06/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// Interface
	@IBOutlet weak var navBar: UINavigationBar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Custom navBar
		self.navBar.backgroundColor = UIColor(red:0.09, green:0.09, blue:0.09, alpha:1)
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


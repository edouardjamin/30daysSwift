//
//  ViewController.swift
//  ClearTableViewCell
//
//  Created by Edouard Jamin on 04/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	// Interface
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var tableView: UITableView!
	
	// data
	let tasks = ["Read stuff on Medium", "Watch some Casey's Vlogs", "Code a new app", "Hustle", "Maybe watch some DailyVee?", "Don't watch too much BuzzFeed", "Go to work", "Wrtie for meltyStyle", "Always Be Closing", "Clean up the flat", "Do some sport", "Catch up on Modern Family", "That's it"]
	
	// Prototype
	var gradientLayer = CAGradientLayer()
	var lastGreenLevel :CGFloat = 0.00
	var preventAnimation :[NSIndexPath] = []
	
	// Functions
	func animateTable() {
		tableView.reloadData()
		
		let cells = tableView.visibleCells
		let tableHeight :CGFloat = tableView.bounds.size.height
		
		for cell in cells {
			let cell :UITableViewCell = cell
			cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
		}
		
		var index = 0
		
		for cellP in cells {
			let cell :UITableViewCell = cellP
			UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveLinear, animations: {
				
				cell.transform = CGAffineTransformMakeTranslation(0, 0)
				
			}, completion: nil)
			
			index++
			
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Table View Configs
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.tasks.count
	}
	
	// green starts at 0.03 and ends at 0.80
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! ClearCellClass
		cell.labelCell.text = tasks[indexPath.row]
		let greenColor :CGFloat = (0.73 / CGFloat(self.tasks.count)) * CGFloat(indexPath.row)
		lastGreenLevel = lastGreenLevel + greenColor
		cell.backgroundColor = UIColor(red:0.96, green: greenColor, blue:0.00, alpha:1)
		return cell
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		animateTable()
	}
	
	// UIStatusBar
	override func prefersStatusBarHidden() -> Bool {
		return true
	}

}


//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Edouard Jamin on 29/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	// Interface
	@IBOutlet weak var tableView: UITableView!
	
	// Prototypes
	let emojis = ["😋", "😑", "❤️", "🎉", "😇", "🙈", "😂", "✈️", "☺️", "😘", "😛", "😍", "😎", "😀", "😌", "💩"]
	var lastRefresh = NSDate()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.tableView.addSubview(self.refreshControl)
		
		// Set up attributes for refresh
		
		// Custom last refresh
		let calendar = NSCalendar.currentCalendar()
		let components = calendar.components(NSCalendarUnit.Hour.union(NSCalendarUnit.Minute), fromDate: lastRefresh)
		let attributes = [NSBackgroundColorAttributeName: UIColor(red:0.13, green:0.15, blue:0.16, alpha:1), NSForegroundColorAttributeName: UIColor.blackColor()]
		self.refreshControl.attributedTitle = NSAttributedString(string: "Last refresh at \(components.hour):\(components.minute)", attributes: attributes)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Table Views Configs
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return emojis.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! CustomCell
		let random_emoji = emojis[Int(floor(drand48() * Double(emojis.count)))]
		cell.titleLabel.text = "\(random_emoji)\(random_emoji)\(random_emoji)\(random_emoji)\(random_emoji)"
		return cell
	}
	
	// Pull to refresh
	func handleRefresh(refresh :AnyObject) {
		self.tableView.reloadData()
		lastRefresh = NSDate()
		refreshControl.endRefreshing()
	}
	
	// Pull-to-refresh
	lazy var refreshControl :UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		refreshControl.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
		return refreshControl
	}()
	
	
	// Black Selection set up
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let selectedCell :UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
		selectedCell.contentView.backgroundColor = UIColor.blackColor()
	}
	
	func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
		let selectedCell :UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
		selectedCell.contentView.backgroundColor = UIColor.blackColor()
		return indexPath
	}
	
	func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
		let selectedCell :UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
		selectedCell.contentView.backgroundColor = UIColor(red:0.13, green:0.15, blue:0.16, alpha:1)
	}
	
	// Status bar
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

}


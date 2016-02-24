//
//  ViewController.swift
//  CustomFonts
//
//  Created by Edouard Jamin on 24/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	// Interface
	
	// Change Button
	@IBOutlet weak var changeButton: UIButton!
	
	// Switcher
	@IBOutlet weak var switcher: UISwitch!
	@IBAction func switcher(sender: AnyObject) {
	}
	
	// change button
	@IBAction func changeButton(sender: AnyObject) {
		if switcher.on {
			currentFont = customFont()
			self.tableView.reloadData()
		} else {
			self.tableView.reloadData()
		}
	}
	
	
	
	// Table View
	@IBOutlet weak var tableView: UITableView!
	
	// protoypes
	let texts = ["Welcome to 30 days of Swift", "This is a simple Table View", "Press change, and our font will change", "Select all, and we'll have the same font", "Hope it will be some fun for you"]
	let fonts = ["Copperplate", "Heiti SC", "Iowan Old Style", "Kohinoor Telugu", "Courier New", "Heiti TC", "Gill Sans", "Apple SD Gothic Neo", "Marker Felt", "Elevate PERSONAL USE ONLY", "Thonburi", "Avenir Next Condensed", "Tamil Sangam MN", "Helvetica Neue", "Gurmukhi MN", "Times New Roman", "Georgia", "Apple Color Emoji", "Arial Rounded MT Bold", "Kailasa", "Kohinoor Devanagari", "Kohinoor Bangla", "Chalkboard SE", "Stonecross", "Sinhala Sangam MN", "PingFang TC", "Gujarati Sangam MN", "Damascus", "Noteworthy", "Geeza Pro", "Avenir", "Academy Engraved LET", "Mishafi", "Futura", "Farah", "Kannada Sangam MN", "Arial Hebrew", "Arial", "Party LET", "Chalkduster", "Hoefler Text", "Optima", "Palatino", "Malayalam Sangam MN", "Al Nile", "Lao Sangam MN", "Bradley Hand", "PingFang HK", "Trebuchet MS", "Helvetica", "Courier", "Cochin", "Hiragino Mincho ProN", "Master Of Break", "Oriya Sangam MN", "Devanagari Sangam MN", "Snell Roundhand", "Zapf Dingbats", "Bodoni 72", "Ancient Geek", "American Typewriter", "Verdana", "Avenir Next", "Baskerville", "Khmer Sangam MN", "Didot", "Savoye LET", "Bodoni Ornaments", "Symbol", "Menlo", "Bodoni 72 Smallcaps", "R&C", "Papyrus", "Hiragino Sans", "PingFang SC", "Euphemia UCAS", "Telugu Sangam MN", "Bangla Sangam MN", "Zapfino", "Bodoni 72 Oldstyle", "Alphabet Fantasie"]
	var currentFont :String = "Helvetica Neue"
	
	// customs functions
	func customFont() -> String {
		let random_number = Int(floor(drand48() * Double(fonts.count)))
		let random_font :String = fonts[random_number]
		return random_font
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		changeButton.layer.cornerRadius = 50
		switcher.setOn(false, animated: true)
		
		// Table View
		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
	}
	
	// Table View configuration
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.texts.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell :UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
		cell.backgroundColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1)
		cell.textLabel?.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1)
		cell.textLabel?.text = self.texts[indexPath.row]
		if self.switcher.on {
			cell.textLabel?.font = UIFont(name: currentFont, size: 16)
		} else {
			cell.textLabel?.font = UIFont(name: customFont(), size: 16)
		}
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// UIBarColor
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}


}


//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Edouard Jamin on 22/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// protoypes
	var counter :Float = 0.0
	var timer = NSTimer()
	
	// Interfaces
	@IBOutlet weak var timeLabel: UILabel!
	

	@IBAction func playButton(sender: AnyObject) {
		timer.invalidate()
		timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "update", userInfo: nil, repeats: true)
	}
	
	@IBAction func pauseButton(sender: AnyObject) {
		timer.invalidate()
	}
	
	
	@IBAction func resterButton(sender: AnyObject) {
		counter = 0
		timer.invalidate()
		timeLabel.text = "0.0"
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	func update() {
		counter = counter + 0.1
		timeLabel.text = String(format: "%.1f", counter)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}


}


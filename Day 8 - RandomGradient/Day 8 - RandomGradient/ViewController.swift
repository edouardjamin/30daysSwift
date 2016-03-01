//
//  ViewController.swift
//  Day 8 - RandomGradient
//
//  Created by Edouard Jamin on 01/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	// Prototypes
	var audioPlayer = AVAudioPlayer()
	var timer = NSTimer()
	var timerLaunched = false
	var counter :Double = 0.00
	let layer = CAGradientLayer()
	
	var colors :[CGColorRef] = [UIColor.redColor().CGColor as CGColorRef, UIColor.greenColor().CGColor as CGColorRef, UIColor.blackColor().CGColor as CGColorRef, UIColor.whiteColor().CGColor as CGColorRef, UIColor.blueColor().CGColor as CGColorRef, UIColor.yellowColor().CGColor as CGColorRef, UIColor.purpleColor().CGColor as CGColorRef, UIColor.orangeColor().CGColor as CGColorRef, UIColor.magentaColor().CGColor as CGColorRef, UIColor.grayColor().CGColor as CGColorRef, UIColor.cyanColor().CGColor as CGColorRef, UIColor.brownColor().CGColor as CGColorRef]
	
	// Interface
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var playButton: UIButton!
	@IBAction func playButton(sender: AnyObject) {
		// Launch Music
		let filePath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("ecstasy", ofType: "mp3")!)
		do {
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
			try AVAudioSession.sharedInstance().setActive(true)
			try audioPlayer = AVAudioPlayer(contentsOfURL: filePath)
			
			audioPlayer.prepareToPlay()
			audioPlayer.play()
			
		} catch let err as NSError {
			print(err)
		}
		
		// Launch Timer
		if (timerLaunched) {
			timer.invalidate()
			audioPlayer.stop()
			timerLaunched = false
		} else {
			timer = NSTimer.scheduledTimerWithTimeInterval(0.30, target: self, selector: "makeGradient", userInfo: nil, repeats: true)
			timerLaunched = true
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.playButton.layer.zPosition = 2
		
		// Generate background at start
		let originalBackground = CAGradientLayer()
		originalBackground.locations = [0.0, 0.25, 0.75, 1.0]
		originalBackground.frame = self.view.bounds
		originalBackground.colors = generateGradient()
		originalBackground.zPosition = 1
		view.layer.addSublayer(originalBackground)
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func makeGradient() {
		counter = counter + 0.30
		
		layer.locations = [0.0, 0.25, 0.75, 1.0]
		layer.frame = self.view.bounds
		layer.colors = generateGradient()
		layer.zPosition = 1
		view.layer.addSublayer(layer)
	}
	
	func generateGradient() -> [CGColorRef] {
		let color1 :CGColorRef = colors[Int(floor(drand48() * Double(colors.count)))]
		let color2 :CGColorRef = colors[Int(floor(drand48() * Double(colors.count)))]
		let color3 :CGColorRef = colors[Int(floor(drand48() * Double(colors.count)))]
		let color4 :CGColorRef = colors[Int(floor(drand48() * Double(colors.count)))]
		
		return [color1, color2, color3, color4]
	}


}


//
//  ViewController.swift
//  Day 10 - SpotifyVideoBackground
//
//  Created by Edouard Jamin on 03/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	// Interface
	@IBOutlet var mainView: UIView!
	@IBOutlet weak var videoView: UIView!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var signupButton: UIButton!
	
	// Prototype
	var player = AVPlayer()
	var counter :Int = 0
	var clipDuration :CMTimeValue = 0
	var clipBeginsAt :CMTime = CMTime()
	
	// Video setting
	let videoURL :NSURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.loginButton.layer.cornerRadius = 7
		self.signupButton.layer.cornerRadius = 7
		
		let f = CGRectMake(0, 0, self.mainView.frame.size.width, self.mainView.frame.size.height)
		let playItem = AVPlayerItem(URL: videoURL)
		player = AVPlayer(playerItem: playItem)
		let playerLayer = AVPlayerLayer(player: player)
		
		self.videoView.frame = f
		playerLayer.frame = f
		videoView.layer.addSublayer(playerLayer)
		player.play()
		
		// NSTimer for looping
		_ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("getCurrentTime"), userInfo: nil, repeats: true)
		
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Status bar
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}
	
	func getCurrentTime() {
		// Get video infos
		let currentItem :AVPlayerItem = player.currentItem!
		let currentTime :CMTime = currentItem.currentTime()
		
		// Get CMTime of the begging of the video
		if counter == 0 {
			clipBeginsAt = currentTime
		}
		
		// Get clip duration
		if counter == 1 {
			clipDuration = currentItem.duration.value
		}
		
		// Loop video when it ends
		if (currentTime.value == clipDuration) {
			player.seekToTime(clipBeginsAt)
			player.play()
		}
		
		// Taht's all folks!
		counter++
	}


}


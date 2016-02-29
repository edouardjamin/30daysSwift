//
//  ViewController.swift
//  LocalVideos
//
//  Created by Edouard Jamin on 25/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	// Interface
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var naviguationBar: UINavigationBar!
	
	var playerView = AVPlayer()
	var playerViewController = AVPlayerViewController()
	
	// infos & prototypes
	let localVideosTitle :[String] = [
		"Introducting Mario Kart 7",
		"Emoji - The Movie",
		"Living in the nature",
		"Always follow your dreams",
		"Facebook Office",
		"Summer Holidays Plans"
	]
	
	let localVideosInfos :[String] = [
		"YouTube - 03:56",
		"Netflix - 01:39:53",
		"Vimeo - 12:37",
		"YouTube - 02:12",
		"Facebook - 04:29",
		"YouTube - 02:47"
	]
	
	// Action
	@IBAction func playVideoWhenButtonDidTouch(sender: AnyObject) {
		let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
		playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
		
		playerViewController.player = playerView
		
		self.presentViewController(playerViewController, animated: true) {
			self.playerViewController.player?.play()
		}
	}
	
	// Table View Configs
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return localVideosTitle.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! VideoCell
		cell.backgroundImage.image = UIImage(named: "videoScreenshot0\(indexPath.row + 1)")
		cell.titleLabel.text = localVideosTitle[indexPath.row]
		cell.infoLabel.text = localVideosInfos[indexPath.row]
		return cell
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// Control name of the nav bar
		self.naviguationBar.topItem!.title = "Watch Later"
		self.naviguationBar.tintColor = UIColor.whiteColor()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Control statut bar
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}


}


//
//  ViewController.swift
//  TumblrMenu
//
//  Created by Edouard Jamin on 07/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	// Interface
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var menuButton: UIButton!
	
	// Data
	var data = [
		posts(avatarImage: UIImage(named: "hugo")!, avatarName: "Hugo", sharedImage: UIImage(named: "1")!),
		posts(avatarImage: UIImage(named: "mengto")!, avatarName: "MengTo", sharedImage: UIImage(named: "2")!),
		posts(avatarImage: UIImage(named: "hugo")!, avatarName: "Hugo", sharedImage: UIImage(named: "1")!),
		posts(avatarImage: UIImage(named: "mengto")!, avatarName: "MengTo", sharedImage: UIImage(named: "2")!)
	]
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// UIStatus bar
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}
	
	// Unwind Segue
	@IBAction func unwindToHome(segue :UIStoryboardSegue) {
	}
	
	// UI CollectionView Configs
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.data.count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = self.collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! TumblrPostCell
		let item = data[indexPath.row]
		cell.avatarImage.image = item.avatarImage
		cell.avatarName.text = item.avatarName
		cell.sharedImage.image = item.sharedImage
		
		return cell
		
	}

}


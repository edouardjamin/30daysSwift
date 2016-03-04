//
//  ViewController.swift
//  Carousel
//
//  Created by Edouard Jamin on 28/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	// Interface
	@IBOutlet weak var collectionView: UICollectionView!
	
	// Data
	var data = [
		item(image: UIImage(named: "bodyline")!, title: "Doing some sport today"),
		item(image: UIImage(named: "darkvarder")!, title: "I do not like Star Wars"),
		item(image: UIImage(named: "dudu")!, title: "Saving the planet"),
		item(image: UIImage(named: "hello")!, title: "Isn't she cute?"),
		item(image: UIImage(named: "hhhhh")!, title: "Where's my hair?"),
		item(image: UIImage(named: "run")!, title: "Should go running some day"),
		item(image: UIImage(named: "wave")!, title: "Still saving the planet")
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Collection View Configs
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CarouselCell
		let item = data[indexPath.row]
		cell.imageView.image = item.image
		cell.titleLabel.text = item.title
		cell.layer.cornerRadius = 7
		return cell
	}
	
	// Light Status bar
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}


}


//
//  ViewController.swift
//  Day 9 - PinchToZoom
//
//  Created by Edouard Jamin on 02/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.scrollView.minimumZoomScale = 1.0
		self.scrollView.maximumZoomScale = 6.0
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

	func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
		return self.imageView
	}
}


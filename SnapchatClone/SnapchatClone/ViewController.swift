//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Edouard Jamin on 28/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// Interface
	@IBOutlet weak var scrollView: UIScrollView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let vcRight = ViewControllerRight(nibName: "ViewControllerRight", bundle: nil)
		self.addChildViewController(vcRight)
		self.scrollView.addSubview(vcRight.view)
		vcRight.didMoveToParentViewController(self)
		
		let vcMiddle = ViewControllerMiddle(nibName: "ViewControllerMiddle", bundle: nil)
		var frame1 = vcMiddle.view.frame
		frame1.origin.x = self.view.frame.size.width
		vcMiddle.view.frame = frame1
		
		self.addChildViewController(vcMiddle)
		self.scrollView.addSubview(vcMiddle.view)
		vcMiddle.didMoveToParentViewController(self)
		
		let vcLeft = ViewControllerLeft(nibName: "ViewControllerLeft", bundle: nil)
		var frame2 = vcLeft.view.frame
		frame2.origin.x = self.view.frame.size.width * 2
		vcLeft.view.frame = frame2
		
		self.addChildViewController(vcLeft)
		self.scrollView.addSubview(vcLeft.view)
		vcLeft.didMoveToParentViewController(self)
		
		self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


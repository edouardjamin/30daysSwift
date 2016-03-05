//
//  LoginController.swift
//  Day 12 - SpotifyLoginScreen
//
//  Created by Edouard Jamin on 05/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
	
	// Interface
	@IBOutlet weak var usernameField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	// AutoLayout
	@IBOutlet weak var usernameCenter: NSLayoutConstraint!
	@IBOutlet weak var passwordCenter: NSLayoutConstraint!
	@IBOutlet weak var loginCenter: NSLayoutConstraint!
	
	// IBAction
	@IBAction func loginButtonToucher(sender :AnyObject) {
		
		// get current bounds
		let bounds = self.loginButton.bounds
		
		// Animate
		UIView.animateWithDuration(1.0, delay: 0.00, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
			
			self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
			self.loginButton.enabled = false
			
			}, completion: { finished in self.loginButton.enabled = true })
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		usernameCenter.constant -= view.bounds.width
		passwordCenter.constant -= view.bounds.width
		loginButton.alpha = 0.00
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		UIView.animateWithDuration(0.5, delay: 0.00, options: .CurveEaseOut, animations: {
			
			self.usernameCenter.constant += self.view.bounds.width
			self.view.layoutIfNeeded()
			
			}, completion: nil)
		
		UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseOut, animations: {
			
			self.passwordCenter.constant += self.view.bounds.width
			self.view.layoutIfNeeded()
			
			}, completion: nil)
		
		UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: {
			
			self.loginButton.alpha = 1.00
			
			}, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.loginButton.layer.cornerRadius = 5
		var usernameFrame = self.usernameField.frame
		usernameFrame.size.height = 50
		self.usernameField.frame = usernameFrame
		
		// Do any additional setup after loading the view.
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Status bar
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

}

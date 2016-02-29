//
//  ViewController.swift
//  FindMyLocation
//
//  Created by Edouard Jamin on 28/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
	
	// prototyopes
	let manager = CLLocationManager()

	@IBOutlet weak var locationLabel: UILabel!
	@IBAction func locationButton(sender: AnyObject) {
		printStatus()
		if ((CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse || CLLocationManager.authorizationStatus() == .AuthorizedAlways) && CLLocationManager.locationServicesEnabled()) {
			startUpdatingLocation()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// Ask for permission
		if CLLocationManager.authorizationStatus() == .NotDetermined && CLLocationManager.locationServicesEnabled() {
			print("Asking for permission...")
			manager.requestWhenInUseAuthorization()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func startUpdatingLocation() {
		manager.delegate = self
		manager.desiredAccuracy = kCLLocationAccuracyBest
		manager.startUpdatingLocation()
		print("Locating...")
		
	}
	
	func printStatus() {
		if (CLLocationManager.authorizationStatus() == .AuthorizedAlways || CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse) {
			print("App is authorized")
		} else if CLLocationManager.authorizationStatus() == .NotDetermined {
			print("Not determined")
		} else if CLLocationManager.authorizationStatus() == .Restricted || CLLocationManager.authorizationStatus() == .Denied {
			print("App is not authorised :(")
		} else {
			print("There is an error")
		}
	}
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		print("Located!")
		CLGeocoder().reverseGeocodeLocation(locations[0], completionHandler: {(placemarks, error) -> Void in
			self.updateLabel(placemarks![0])
		})
	}
	
	func updateLabel(placemark :AnyObject) {
		manager.stopUpdatingLocation()
		let locality = placemark.locality!
		let country = placemark.country!
		locationLabel.text = "\(locality!), \(country!)"
	}
	
	func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
		print("There were an error: \(error)")
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return UIStatusBarStyle.LightContent
	}

}


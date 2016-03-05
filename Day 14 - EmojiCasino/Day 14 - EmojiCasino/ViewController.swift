//
//  ViewController.swift
//  Day 14 - EmojiCasino
//
//  Created by Edouard Jamin on 05/03/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	// Interface
	@IBOutlet weak var emojiPicker: UIPickerView!
	@IBOutlet weak var goButton: UIButton!
	@IBOutlet weak var resultLabel: UILabel!
	
	// func
	func selectRandomRow() {
		self.emojiPicker.selectRow(Int(floor(drand48() * 999)), inComponent: 0, animated: true)
		self.emojiPicker.selectRow(Int(floor(drand48() * 999)), inComponent: 1, animated: true)
		self.emojiPicker.selectRow(Int(floor(drand48() * 999)), inComponent: 2, animated: true)
	}
	
	// @IBAction
	@IBAction func goAction(sender: AnyObject) {
		selectRandomRow()
		print(self.emojiPicker.selectedRowInComponent(0))
		print(emojis[self.emojiPicker.selectedRowInComponent(0) % actual_length])
		
		let result0 = self.emojiPicker.selectedRowInComponent(0) % actual_length
		let result1 = self.emojiPicker.selectedRowInComponent(1) % actual_length
		let result2 = self.emojiPicker.selectedRowInComponent(2) % actual_length
		
		if (result0 == result1) && (result0 == result2) {
			print("WE HAVE A WINNER!")
			self.resultLabel.text = "❤️"
		}
	}
	
	// Prototypes
	var actual_length :Int = 0 // 29
	
	// data
	let emojis :[String] = ["💔", "😅", "✌🏼", "😘", "🐌", "🚓", "😊", "😈", "😎", "😏", "😸", "🐔", "❤️", "💜", "💩", "✈️", "🙈", "😛", "😍", "😇", "😂", "😱", "🙏🏼", "🐶", "🙊", "☀️", "🌚", "🍕", "🍑"]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// Interface
		self.goButton.layer.cornerRadius = 5
		
		actual_length = emojis.count
		
		selectRandomRow()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return 999
	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 3
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		// return self.emojis[Int(floor(drand48() * Double(actual_length)))]
		return self.emojis[(row % actual_length)]
	}

}


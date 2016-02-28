//
//  ViewControllerMiddle.swift
//  SnapchatClone
//
//  Created by Edouard Jamin on 28/02/16.
//  Copyright © 2016 Edouard Jamin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerMiddle: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	let captureSession = AVCaptureSession()
	var captureDevice :AVCaptureDevice?
	
	override func viewDidAppear(animated: Bool) {
		captureSession.sessionPreset = AVCaptureSessionPresetLow
		
		let devices = AVCaptureDevice.devices()
		
		for device in devices {
			print(device)
			if(device.hasMediaType(AVMediaTypeVideo)) {
				if(device.position == AVCaptureDevicePosition.Back) {
					captureDevice = device as? AVCaptureDevice
					print("Device found!")
				}
			}
		}
		
		if captureDevice != nil {
			beginSession()
		}
		
	}
	
	func beginSession() {
		var err : NSError? = nil
		do {
			try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
		} catch {
			print(err)
		}
		
		
		if err != nil {
			print("error: \(err?.localizedDescription)")
		}
		
		let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
		self.view.layer.addSublayer(previewLayer)
		previewLayer?.frame = self.view.layer.frame
		captureSession.startRunning()
	}
	
	/*
if let device = captureDevice {
// device.lockForConfiguration()
device.focusMode = .Locked
device.unlockForConfiguration()
}
*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

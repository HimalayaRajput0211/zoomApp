//
//  ViewController.swift
//  ZoomApp
//
//  Created by Himalaya Rajput on 16/04/20.
//  Copyright © 2020 Himalaya Rajput. All rights reserved.
//

import UIKit
import MobileRTC

class ViewController: UIViewController {

    @IBOutlet weak var meetingNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func joinMeeting(_ sender: UIButton) {
        guard let meetingNumber = meetingNumberTextField.text else { return }
        guard !meetingNumber.isEmpty else { return }
        guard let meetingService = MobileRTC.shared().getMeetingService() else { return }
        meetingService.delegate = self
        let parameters = [
            "kMeetingParam_Username" : "Himalaya Rajput",
            "kMeetingParam_MeetingNumber": meetingNumber
        ]
        meetingService.joinMeeting(with: parameters)
    }
    
}

extension ViewController: MobileRTCMeetingServiceDelegate {
    
}

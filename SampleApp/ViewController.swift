//
//  ViewController.swift
//  SampleApp
//
//  Created by Benoit Deldicque on 03/09/2018.
//  Copyright © 2018 Benoit Deldicque. All rights reserved.
//

import UIKit
import BDLocalizedDevicesModels

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = UIDevice.current.localizedProductName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

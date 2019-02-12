//
//  UIDevice+BDLocalizedDevicesModels.swift
//  BDLocalizedDevicesModels
//
//  Created by Benoit Deldicque on 26/06/2018.
//  Copyright © 2018 Benoit Deldicque. All rights reserved.
//

import UIKit

public typealias BDDevice = UIDevice

public extension BDDevice {
    /// The product name of the device.
    @objc public var productName: String {
        // Retrieve english bundle.
        guard let englishPath = self.frameworkBundle.path(forResource: "en", ofType: "lproj") else {
            return self.localizedProductName // Fallback on localized model
        }

        guard let englishBundle = Bundle(path: englishPath) else {
            return self.localizedProductName // Fallback on localized model
        }

        return NSLocalizedString(self.deviceTypeIdentifier, tableName: "DeviceModel",
                                 bundle: englishBundle, value: self.deviceTypeIdentifier, comment: "")
    }

    /// The product name of the device as a localized string.
    @objc public var localizedProductName: String {
        return NSLocalizedString(self.deviceTypeIdentifier, tableName: "DeviceModel",
                                 bundle: self.frameworkBundle, value: self.deviceTypeIdentifier, comment: "")
    }

    // MARK: -
    private var deviceTypeIdentifier: String {
        // Check if device is a simulator to get the right machine identifier.
        if let machine = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return machine
        } else {
            var size: Int = 0
            sysctlbyname("hw.machine", nil, &size, nil, 0)
            var machine = [CChar](repeating: 0, count: size)
            sysctlbyname("hw.machine", &machine, &size, nil, 0)

            return String(cString: machine)
        }
    }

    private var frameworkBundle: Bundle {
        return Bundle(identifier: "com.bddq.BDLocalizedDevicesModels")!
    }
}

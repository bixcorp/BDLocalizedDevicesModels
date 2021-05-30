//
//  LocalizedModel.swift
//  BDLocalizedDevicesModels
//
//  Created by Benoit Deldicque on 26/06/2018.
//  Copyright © 2018 Benoit Deldicque. All rights reserved.
//

#if os(watchOS)
import WatchKit

public extension WKInterfaceDevice {
    /// The product name of the device.
    @objc var productName: String {
        LocalizedDeviceModel.productName
    }

    /// The product name of the device as a localized string.
    @objc var localizedProductName: String {
        LocalizedDeviceModel.localizedProductName
    }
}
#endif

#if os(tvOS) || os(iOS)
import UIKit

public extension UIDevice {
    /// The product name of the device.
    @objc var productName: String {
        LocalizedDeviceModel.productName
    }

    /// The product name of the device as a localized string.
    @objc var localizedProductName: String {
        LocalizedDeviceModel.localizedProductName
    }
}

#endif

#if !os(macOS)
var deviceTypeIdentifier: String {
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

var productName: String {
    // Retrieve english bundle.
    guard let englishPath = Bundle.module.path(forResource: "en", ofType: "lproj") else {
        return localizedProductName // Fallback on localized model
    }

    guard let englishBundle = Bundle(path: englishPath) else {
        return localizedProductName // Fallback on localized model
    }

    return NSLocalizedString(deviceTypeIdentifier, tableName: "DeviceModel",
                             bundle: englishBundle, value: deviceTypeIdentifier, comment: "")
}

var localizedProductName: String {
    NSLocalizedString(deviceTypeIdentifier, tableName: "DeviceModel",
                      bundle: Bundle.module, value: deviceTypeIdentifier, comment: "")
}
#endif

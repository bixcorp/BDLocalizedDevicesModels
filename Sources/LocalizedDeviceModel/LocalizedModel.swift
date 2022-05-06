//
//  LocalizedModel.swift
//  BDLocalizedDevicesModels
//
//  Created by Benoit Deldicque on 26/06/2018.
//  Copyright © 2018 Benoit Deldicque. All rights reserved.
//

#if !os(macOS)
import Foundation

var deviceTypeIdentifier: String {
    // Check if device is a simulator to get the right machine identifier.
    if let machine = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
        return machine
    } else {
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: size)
        sysctlbyname("hw.machine", &machine, &size, nil, 0)

        return String(cString: machine)
    }
}

// MARK: -

/// The product name of the device.
///
/// If no English localization is found, the product identifier will be returned.
public var productName: String {
    // Retrieve english bundle.
    guard let englishPath = Bundle.module.path(forResource: "en", ofType: "lproj") else {
        return deviceTypeIdentifier // Fallback on device identifier.
    }

    guard let englishBundle = Bundle(path: englishPath) else {
        return deviceTypeIdentifier // Fallback on device identifier.
    }

    return NSLocalizedString(deviceTypeIdentifier, tableName: "DeviceModel",
                             bundle: englishBundle, value: deviceTypeIdentifier, comment: "")
}

/// The product name of the device as a localized string.
///
/// If no localization is found, the product identifier will be returned.
public var localizedProductName: String {
    NSLocalizedString(deviceTypeIdentifier, tableName: "DeviceModel",
                      bundle: Bundle.module, value: deviceTypeIdentifier, comment: "")
}
#endif

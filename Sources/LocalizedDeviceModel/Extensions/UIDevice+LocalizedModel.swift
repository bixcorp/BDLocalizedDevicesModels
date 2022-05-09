//
//  UIDevice+LocalizedModel.swift
//  BDLocalizedDevicesModels
//
//  Created by Benoit Deldicque on 06/05/2022.
//  Copyright © 2022 Benoit Deldicque. All rights reserved.
//

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

//
//  BundleFinder.swift
//  LocalizedDeviceModel
//
//  Created by Benoit Deldicque on 30/05/2021.
//

import Foundation
import class Foundation.Bundle

// This file will help building package using a scheme for Swift Package Index.

private class BundleFinder {}

extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var module: Bundle = {
        let bundleName = "LocalizedDeviceModel_LocalizedDeviceModel"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
            Bundle(for: BundleFinder.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("Unable to find bundle named LocalizedDeviceModel_LocalizedDeviceModel")
    }()
}

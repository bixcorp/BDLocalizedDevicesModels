//
//  ContentView.swift
//  SampleWatchApp WatchKit Extension
//
//  Created by Benoit Deldicque on 30/05/2021.
//

import LocalizedDeviceModel
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(WKInterfaceDevice.current().localizedProductName)
            .font(.body)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .padding()
        Text(WKInterfaceDevice.current().productName)
            .font(.footnote)
            .foregroundColor(Color.gray)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

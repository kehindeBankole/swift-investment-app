//
//  RiseNativeApp.swift
//  RiseNative
//
//  Created by kehinde on 27/12/2023.
//

import SwiftUI

@main
struct RiseNativeApp: App {
    @State private var appData = ApiData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(appData)
        }
    }
}

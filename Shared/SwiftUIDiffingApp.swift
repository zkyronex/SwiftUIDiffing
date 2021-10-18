//
//  SwiftUIDiffingApp.swift
//  Shared
//
//  Created by Jason Chan on 18/10/21.
//

import SwiftUI

@main
struct SwiftUIDiffingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: TestPresenter())
        }
    }
}

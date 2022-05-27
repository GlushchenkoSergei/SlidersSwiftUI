//
//  SlidersSwiftUIApp.swift
//  SlidersSwiftUI
//
//  Created by mac on 27.05.2022.
//

import SwiftUI

@main
struct SlidersSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//
//  ContentView.swift
//  SlidersSwiftUI
//
//  Created by mac on 27.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
            ZStack {
                Color("darkBlue")
                    .ignoresSafeArea()
                VStack(spacing: 40) {
                    RectangleView(red: red, green: green, blue: blue)
                    
                    VStack {
                        ColorSliderView(value: $red, color: .red)
                        ColorSliderView(value: $green, color: .green)
                        ColorSliderView(value: $blue, color: .blue)
                    }
                    .focused($isInputActive)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isInputActive = false
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }


// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



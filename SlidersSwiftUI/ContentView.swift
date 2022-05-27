//
//  ContentView.swift
//  SlidersSwiftUI
//
//  Created by mac on 27.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = 0.0
    @State private var green = 0.0
    @State private var blue = 0.0
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                RectangleView(red: $red, green: $green, blue: $blue)
                
                //Не уверен, что так правильно создавать сразу стек с разными элементами: но выглядит код чисто.
                SetHorizontalStackView(value: $red, color: .red)
                SetHorizontalStackView(value: $green, color: .green)
                // Есть вопрос? как вызвать Color Literal? Пришлось колхозить через Assets
                SetHorizontalStackView(value: $blue, color: Color("darkBlue"))
                    .buttonForKeyboard()
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Create custom  rectangle
struct RectangleView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(height: 200)
            .cornerRadius(20)
    }
}

// MARK: - Set horizontal stack view
struct SetHorizontalStackView: View {
    @Binding var value: Double
    let color: Color?
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 32)
                .lineLimit(1)
                .foregroundColor(.white)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            
            
            TextField("123", value: $value, format: .number)
                .frame(width: 45)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
        }
    }
}

// MARK: - Create extension for keyboard
struct ButtonForKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done") { UIApplication.shared.endEditing() }
                }
            }
    }
}

extension View {
    func buttonForKeyboard() -> some View {
        modifier(ButtonForKeyboard())
    }
}

// MARK: - PreviewProvider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



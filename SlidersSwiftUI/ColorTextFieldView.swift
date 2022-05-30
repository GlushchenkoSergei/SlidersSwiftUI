//
//  ColorTextFieldView.swift
//  SlidersSwiftUI
//
//  Created by mac on 30.05.2022.
//

import SwiftUI

struct ColorTextFieldView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation {
                checkValue()
            }
        }
        .frame(width: 45)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Неправильный формат", isPresented: $showAlert, actions: {}) {
            Text("Введите число от 0 до 255")
        }
    }
    
    
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct ColorTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ColorTextFieldView(textValue: .constant("128"), value: .constant(128))
        }
    }
}

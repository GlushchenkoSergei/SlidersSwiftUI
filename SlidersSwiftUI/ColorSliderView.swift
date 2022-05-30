//
//  ColorSliderView.swift
//  SlidersSwiftUI
//
//  Created by mac on 30.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var textValue = ""
    
    let color: Color
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(lround(value))")
                    .frame(width: 32)
                    .lineLimit(1)
                    .foregroundColor(.white)
                
                Slider(value: $value, in: 0...255, step: 1)
                    .accentColor(color)
                    .onChange(of: value) { newValue in
                        textValue = "\(lround(newValue))"
                    }
                ColorTextFieldView(textValue: $textValue, value: $value)
            }
            .onAppear {
                textValue = "\(lround(value))"
            }
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            ColorSliderView(value: .constant(100), color: .blue)
        }
    }
}

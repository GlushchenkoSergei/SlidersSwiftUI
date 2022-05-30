//
//  RectangleView.swift
//  SlidersSwiftUI
//
//  Created by mac on 30.05.2022.
//

import SwiftUI

struct RectangleView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(height: 200)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            RectangleView(red: 255, green: 1, blue: 200)
        }
    }
}

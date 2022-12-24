//
//  WeatherButton.swift
//  Weather
//
//  Created by Abiodun Anifowose on 12/23/22.
//

import SwiftUI

struct mainButtonView: View {
    var title: String
    var fontColor: Color
    var backGroundColor: Color
    
    var body: some View {
        Text (title)
            .frame(width: 280, height: 50)
            .background(backGroundColor)
            .foregroundColor(fontColor)
            .font(.system(size: 20, weight: .bold, design: .default)).cornerRadius(10)
    }
}

//
//  ContentFormatting.swift
//  100Days - Temp conversion WatchKit Extension
//
//  Created by Anders Munck on 29/11/2019.
//  Copyright © 2019 Anders Munck. All rights reserved.
//

import Foundation
import SwiftUI

// Line formatting
struct outputSmall: View {
    var outputNumber: Double
    var outputType: String
    var outputDecimals: Int
    var outputColor: Color

    var body: some View {
        HStack {
            VStack {
                Text("\(outputNumber, specifier: "%.\(outputDecimals)f") \(outputType)")
                    .foregroundColor(outputColor)
                    .font(.system(size: 12))
            }
        }
    }
}

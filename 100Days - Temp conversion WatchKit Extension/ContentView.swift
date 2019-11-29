//
//  ContentView.swift
//  100Days - Temp conversion WatchKit Extension
//
//  Created by Anders Munck on 21/11/2019.
//  Copyright © 2019 Anders Munck. All rights reserved.
//

import SwiftUI

// This was originally all embedded in ContentView, where it worked,
// but after I tried to separate logic from formatting, I ran into issues.


// Line formatting
struct lineView: View {
    // Input values
    var outputNumber: Double
    var outputType: String
    var outputDecimals: Int
    var outputColor: Color
    
    // Crown values
    @State private var inputCrown: Double
    let maxCrownValue: Double = 999

    var body: some View {
        // TODO: Format HStack when in focus. Don't know how to use ".focusable(true, onFocusChange: ???)" yet
        HStack {
                Text("\(outputNumber, specifier: "%.\(outputDecimals)f")")
                    .font(.system(size: 19))
                    .fontWeight(.black)
                    .frame(width: 45, alignment: .trailing)
            Text(outputType)
            Spacer()
        }
            .foregroundColor(outputColor)
            .focusable(true)
            .digitalCrownRotation($inputCrown, from: 0.0, through: maxCrownValue, by: 1.0, sensitivity: .low)
    }
}

// Section formatting
struct sectionView: View {
    // MARK: I can obviously add "temperatureConversion" as a type here, but then I wouldn't be able to switch to other calculations later.
    var content: View
    var headerText: String
    
    var body: some View {
        Section(header: Text(headerText)) {
            content
            .background(Color.white.opacity(0.05))
        }
        
    }
}

// Logic
struct temperatureConversion: View {
    var calculation: String
    var inputCrown: Double
    // Temperature output variables
    var outputKelvin: Double {
        inputCrown
    }
    var outputCelcius: Double {
        inputCrown - 273.15
    }
    var outputFahrenheit: Double {
        outputCelcius * 9/5 + 32
    }
    var body: some View {
        VStack {
            lineView(outputNumber: outputCelcius, outputType: "Celcius", outputDecimals: 0, outputColor: Color.green)
            lineView(outputNumber: outputKelvin, outputType: "Kelvin", outputDecimals: 0, outputColor: Color.blue)
            lineView(outputNumber: outputFahrenheit, outputType: "Fahrenheit", outputDecimals: 0, outputColor: Color.orange)
        }
    }
}


struct ContentView: View {
    
    var body: some View {
        // MARK: I'd like to have an array of possible conversion models here, so I can generate a list.
        
        ScrollView {
            // MARK: This is obviously not working as expected
            sectionView(content: temperatureConversion)
        }
    }
    // End body
}
// End struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

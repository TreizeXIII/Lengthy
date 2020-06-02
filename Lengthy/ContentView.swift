//
//  ContentView.swift
//  Lengthy
//
//  Created by AL3 on 5/31/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var inp = ""
    @State var from = 0
    @State var to = 4
    let units = ["meters","kilometers","feet","yards","miles"]
    var inMeasure: Measurement<UnitLength>{
        switch from {
        case 0:
            return Measurement(value: Double(inp) ?? 0, unit: .meters)
        case 1:
            return Measurement(value: Double(inp) ?? 0, unit: .kilometers)
        case 2:
            return Measurement(value: Double(inp) ?? 0, unit: .feet)
        case 3:
            return Measurement(value: Double(inp) ?? 0, unit: .yards)
        case 4:
            return Measurement(value: Double(inp) ?? 0, unit: .miles)
        default:
            return Measurement(value: 0, unit: .miles)
        }
    }
    var outMeasure: Measurement<UnitLength>{
        switch to {
        case 0:
            return inMeasure.converted(to: .meters)
        case 1:
            return inMeasure.converted(to: .kilometers)
        case 2:
            return inMeasure.converted(to: .feet)
        case 3:
            return inMeasure.converted(to: .yards)
        case 4:
            return inMeasure.converted(to: .miles)
        default:
            return inMeasure
        }
    }
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Convert From:")){
                    TextField("From:", text: $inp)
                        .keyboardType(.decimalPad)
                    Picker("Unit", selection: $from, content: {
                        ForEach(0..<5){
                            Text("\(self.units[$0])")
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Convert To:")){
                    Picker("Unit", selection: $to, content: {
                        ForEach(0..<5){
                            Text("\(self.units[$0])")
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                    Text("Converted: \(outMeasure.value)")
                }
            }
        .navigationBarTitle("Lenghty Convert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

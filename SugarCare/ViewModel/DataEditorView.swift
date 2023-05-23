//
//  DataEditorView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SwiftUI

struct DataEditorView: View {
    @State var weight: Int?
    @State var height: Int?
    @State var activityMult: Double?
    let multiplierList = [1.2, 1.3, 1.5, 1.7, 1.9]
    
    var body: some View {
        List {
            Picker("Weight", selection: $weight) {
                ForEach(50..<100) {
                    Text("\($0)")
                }
            }
            Picker("Height", selection: $height) {
                ForEach(70..<200) {
                    Text("\($0)")
                }
            }
            Picker("Activity Multiplier", selection: $activityMult) {
                ForEach(multiplierList, id: \.self) { mult in
                    if mult == 1.2 {
                        Text("Sedentary")
                    }
                    else if mult == 1.3 {
                        Text("Light")
                    }
                    else if mult == 1.5 {
                        Text("Moderate")
                    }
                    else if mult == 1.7 {
                        Text("Active")
                    }
                    else if mult == 1.9 {
                        Text("Very Active")
                    }
                }
            }
        }
    }
}

struct DataEditorView_Previews: PreviewProvider {
    static var previews: some View {
        DataEditorView()
    }
}

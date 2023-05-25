//
//  DataEditorView.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 23/05/23.
//

import SwiftUI

struct DataEditorView: View {
    let currentYear = Calendar.current.component(.year, from: Date())
    let dataEditorViewController: DataEditorViewController
    
    @State var weight: Int = 50
    @State var height: Int = 70
    @State var year: Int = 1990
    @State var genderMult: Int = 5
    @State var activityMult: Int = 1
    
    var body: some View {
        List {
            Section("") {
                Picker("Weight", selection: $weight) {
                    ForEach(50..<100) {
                        Text("\($0) kg").tag($0)
                    }
                }
                Picker("Height", selection: $height) {
                    ForEach(70..<200) {
                        Text("\($0) cm").tag($0)
                    }
                }
                Picker("Date of Birth (Year)", selection: $year) {
                    ForEach(currentYear - 75 ..< currentYear + 1) {
                        Text("\(String($0))").tag($0)
                    }
                }
                Picker("Gender", selection: $genderMult) {
                    Text("Male").tag(5)
                    Text("Female").tag(-161)
                }
                Picker("Activity Multiplier", selection: $activityMult) {
                    Text("Sedentary").tag(1) // 1.2
                    Text("Light").tag(2) // 1.3
                    Text("Moderate").tag(3) // 1.5
                    Text("Active").tag(4) // 1.7
                    Text("Very Active").tag(5) // 1.9
                }
            }
            
            Section("") {
                Button("Save User Data") {
                    var mult: Float = 0
                    
                    if activityMult == 1 {
                        mult = 1.2
                    }
                    else if activityMult == 2 {
                        mult = 1.3
                    }
                    else if activityMult == 3 {
                        mult = 1.5
                    }
                    else if activityMult == 4 {
                        mult = 1.7
                    }
                    else if activityMult == 5 {
                        mult = 1.9
                    }
                    
                    dataEditorViewController.saveHandler(weight: Float(weight), height: Float(height), year: year, genderMult: genderMult, activityMult: mult)
                }
            }
        }
    }
}

struct DataEditorView_Previews: PreviewProvider {
    static var previews: some View {
        DataEditorView(dataEditorViewController: DataEditorViewController())
    }
}
